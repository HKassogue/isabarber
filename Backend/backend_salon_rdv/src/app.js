require("dotenv").config();
const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const morgan = require("morgan");

const routes = require("./routes");

const app = express();

app.use(cors());
app.use(helmet());
app.use(express.json({ limit: "1mb" }));
app.use(morgan("dev"));

app.get("/", (req, res) => { tT
Name	Last commit message
	Last commit date
HKassogue
HKassogue
Initiazation
293d6dc
 · 
Feb 11, 2026
android
  res.json({ message: "Backend Salon RDV OK ✅", version: "1.0.0" });
});

app.use("/api", routes);

// 404
app.use((req, res) => {
  res.status(404).json({ message: "Route introuvable." });
});

module.exports = app;
