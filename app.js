import dotenv from "dotenv";
import express from "express";
import cookieParser from "cookie-parser";
import { logger } from "./logs/logger.js";
import { client } from "./database.mjs";
import { signup, login } from "./controllers/userAuthControllers.js";
import { insertRouter } from "./routes/allAddRoutes.js";
import { getRouter } from "./routes/allGetRoutes.js";
import { protect } from "./services/protectEndpoints.js"; 
import { registerNewWorkerByTechnicalDirector, loginWorker } from "./controllers/workerAuthControllers.js";

dotenv.config({ path: "./config.env" });

const app = express();
app.disable("x-powered-by");
app.use(cookieParser());
app.use(express.json());

app.post("/register_new_worker", protect, registerNewWorkerByTechnicalDirector);
app.post("/login_worker", loginWorker);

app.post("/signup", signup);
app.post("/login", login);

app.use("/get", protect, getRouter);
app.use("/add", protect, insertRouter);
app.use("/regular_shop", insertRouter);


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
    process.exit(1);
  });
});
