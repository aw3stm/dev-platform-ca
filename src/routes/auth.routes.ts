import { Router } from "express";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { pool } from "../db/database.js";
import { RowDataPacket, ResultSetHeader } from "mysql2";

const router = Router();

router.post("/register", async (req, res) => {
  const { email, password } = req.body;

  if (typeof email !== "string" || typeof password !== "string") {
    return res.status(400).json({
      message: "Email and password must be text",
    });
  }

  if (typeof email !== "string" || typeof password !== "string") {
    return res.status(400).json({
      message: "Email and password are required!",
    });
  }

  const [existingUsers] = await pool.execute<RowDataPacket[]>(
    "SELECT id FROM users WHERE email = ?",
    [email],
  );

  if (existingUsers.length > 0) {
    return res.status(409).json({
      message: "Email already registered.",
    });
  }

  const passwordHash = await bcrypt.hash(password, 10);

  const [result] = await pool.execute<ResultSetHeader>(
    `INSERT INTO users (email, password_hash)
    VALUES (?, ?)`,
    [email, passwordHash],
  );

  res.status(201).json({
    message: "User registered",
    userId: result.insertId,
  });
});

router.post("/login", async (req, res) => {
  const { email, password } = req.body;

  if (typeof email !== "string" || typeof password !== "string") {
    return res.status(400).json({
      message: "Email and password must be text",
    });
  }

  if (email.trim() === "" || password.trim() === "") {
    return res.status(400).json({
      message: "Email and password are required",
    });
  }

  const [users] = await pool.execute<RowDataPacket[]>(
    "SELECT id, email, password_hash FROM users WHERE email = ?",
    [email],
  );

  if (users.length === 0) {
    return res.status(401).json({
      message: "Invalid email or password",
    });
  }

  const user = users[0];

  const passwordMatch = await bcrypt.compare(password, user.password_hash);

  if (!passwordMatch) {
    return res.status(401).json({
      message: "Invalid email or password",
    });
  }

  const token = jwt.sign(
    { userId: user.id, email: user.email },
    process.env.JWT_SECRET!,
    { expiresIn: "1h" },
  );

  res.json({
    message: "Login successful",
    token,
  });
});

export default router;
