import crypto from "crypto";
// import { promisify } from "util";
// import jwt from "jsonwebtoken";
import catchAsync from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import bcrypt from "bcryptjs";
import { client } from "../database.mjs";
import { createSendToken } from "../services/tokenService.js";
import isCorrectPassword from "../services/isCorrectPassword.js";
import { getWorkerQueryByEmail } from "../utils/queryConstants.js";
import { logger } from "../logs/logger.js";

export const registerNewWorkerByTechnicalDirector = catchAsync(async (req, res, next) => {
  const {
    worker_name,
    barcode,
    created_by_id,
    updated_by_id,
    role_id,
    status_id,
    email,
    phone_number,
    sale_promocode
  } = req.body;
  const saltRounds = 10;
  
  try {
    const hashedPassword = await bcrypt.hash(barcode.toString(), saltRounds);
    const newUser = await client.query(
      `INSERT INTO workers (worker_name,
        barcode_hash,
        created_by_id,
        updated_by_id,
        role_id,
        status_id,
        email,
        phone_number,
        sale_promocode) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id`,
      [
        worker_name,
        hashedPassword,
        created_by_id,
        updated_by_id,
        role_id,
        status_id,
        email,
        phone_number,
        sale_promocode,
      ]
    );

    createSendToken(newUser.rows[0], "worker", 201, res);
  } catch (error) {
    // Handle any errors that occur during signup or token creation
    next(error);
  }
});

export const loginWorker = catchAsync(async (req, res, next) => {
  const { email, barcode } = req.body;

  //1) check if the email and password exist
  if (!email || !barcode) {
    throw next(new AppError("Please type your email and barcode", 400));
  }
  // 2) check if the user and password are correct
  const worker = await client.query(getWorkerQueryByEmail, [email]);

  if (worker.rowCount === 0 || !(await isCorrectPassword(barcode.toString(), worker.rows[0].barcode_hash))) {
    throw next(new AppError("Please type e-mail and password correct", 401));
  }

  // console.log(user.rows[0].id);
  // 3) if everything ok, send token to client
  createSendToken(worker.rows[0], "worker", 200, res);
  logger.info(`user with email ${email} logged in successfully`)
});

// export const resetBarcode = catchAsync(async (req, res, next) => {
//   // 1) Get user based on the token
//   const hashedToken = crypto.createHash("sha256").update(req.params.token).digest("hex");

//   const getUserQuery = `
//     SELECT * FROM users
//     WHERE password_reset_token = $1 AND password_reset_expires > NOW()
//   `;
//   const values = [hashedToken];
//   const { rows: users } = await client.query(getUserQuery, values);

//   if (users.length === 0) {
//     return next(new AppError("Token is invalid or has expired!", 400));
//   }

//   const user = users[0];

//   // 2) If token has not expired, and there is user, set the new password
//   const saltRounds = 10;
//   const hashedPassword = await bcrypt.hash(req.body.password, saltRounds);

//   const updateUserQuery = `
//     UPDATE users
//     SET password = $1, password_confirm = $2,
//         password_reset_token = NULL, password_reset_expires = NULL
//     WHERE id = $3
//   `;

//   const updateValues = [hashedPassword, req.body.passwordConfirm, user.id];
//   await client.query(updateUserQuery, updateValues);

//   // 3) Update changedPasswordAt property for the user
//   // Assuming you have a 'changed_password_at' column in your database
//   const updateChangedPasswordQuery = `
//     UPDATE users
//     SET changed_password_at = NOW()
//     WHERE id = $1
//   `;
//   await client.query(updateChangedPasswordQuery, [user.id]);

//   // 4) Log the user in, send JWT
//   const token = signToken(user.id);

//   // Send the token and user details in the response
//   res.status(200).json({
//     status: "success",
//     token,
//     user,
//   });
// });
