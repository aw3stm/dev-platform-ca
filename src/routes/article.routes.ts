import { Router } from "express";
import { pool } from "../db/database.js";
import { RowDataPacket } from "mysql2";
import { authenticateToken } from "../middleware/auth.middleware.js";

const router = Router();

router.get("/", async (_req, res) => {
  const [rows] = await pool.execute(
    "SELECT id, title, body, category, submitted_by, created_at FROM articles",
  );

  res.json(rows);
});

router.get("/:id", async (req, res) => {
  const { id } = req.params;

  const [rows] = await pool.execute<RowDataPacket[]>(
    "SELECT id, title, body, category, submitted_by, created_at FROM articles WHERE id = ?",
    [id],
  );

  if (rows.length === 0) {
    return res.status(404).json({
      message: "Article not found",
    });
  }

  res.json(rows);
});

router.post("/", authenticateToken, async (req, res) => {
  const { title, body, category } = req.body;

  if (
    typeof title !== "string" ||
    typeof body !== "string" ||
    typeof category !== "string"
  ) {
    return res.status(400).json({
      message: "Title, body and category must be text.",
    });
  }

  if (title.trim() === "" || body.trim() === "" || category.trim() === "") {
    return res.status(400).json({
      message: "Title, body and category cannot be empty.",
    });
  }

  const submitted_by = req.user!.userId;

  const [users] = await pool.execute<RowDataPacket[]>(
    "SELECT id FROM users WHERE id = ?",
    [submitted_by],
  );

  if (users.length === 0) {
    return res.status(401).json({
      message: "User no longer exists",
    });
  }

  const [result] = await pool.execute(
    `INSERT INTO articles (title, body, category, submitted_by)
     VALUES (?, ?, ?, ?)`,
    [title, body, category, submitted_by],
  );

  res.status(201).json({
    message: "Article created",
    result,
  });
});

export default router;
