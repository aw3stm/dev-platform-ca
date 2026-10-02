import express from "express";

const app = express();
app.use(express.json());

const PORT = 3000;

app.get("/", (_req, res) => {
  res.send("Article API is running!");
});

app.post("/test", (req, res) => {
  console.log(req.body);

  res.json({
    message: "Data received!",
    data: req.body,
  });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
