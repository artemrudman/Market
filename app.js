import express from "express";
import { logger } from "./logs/logger.js";
import dotenv from "dotenv";
import { client } from "./database.mjs";
import { signup, login } from "./controllers/authControllers.js";
import { insertRouter } from "./routes/addRoutes.js";
import { getRouter } from "./routes/getRoutes.js"; 


dotenv.config({ path: "./config.env" });

const app = express();
app.use(express.json());


app.post("/signup", signup);
app.post("/login", login);


app.use("/get", getRouter);
app.use("/add", insertRouter);


client
  .connect()
  .then(() => {
    logger.info("Connected to the database");
  })
  .catch((err) => {
    console.error("Error connecting to the database", err);
  });

const server = app.listen(process.env.PORT || 8080, () => {
  logger.info(`app is running on port ${process.env.PORT}`);
});

process.on(`unhandledRejection`, (err) => {
  logger.info(`UNHANDLED REJECTION! Shutting down...`);
  logger.info(err.name, err.message);
  server.close(() => {
    logger.info("Server has been closed");
  });
  process.exit(1);
});
