import Postgres from 'pg';
import dotenv from "dotenv";

dotenv.config({ path: "./config.env" });

export const client = new Postgres.Pool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    port: process.env.DB_PORT, 
    password: process.env.DB_PASSWORD,
    database: process.env.DB
}) 