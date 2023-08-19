import crypto from "crypto";
import { promisify } from "util";
import jwt from "jsonwebtoken";
import catchAsync from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import bcrypt from "bcryptjs";
import { client } from "../database.mjs";
import { createSendToken } from "../services/tokenService.js";
import isCorrectPassword from "../services/isCorrectPassword.js";
import { sendEmail } from "../utils/email.js";

export const signup = catchAsync(async (req, res, next) => {
  try {
    const {
      user_name,
      user_password,
      general_status_id,
      email,
      phone_number,
      sale_promocode,
      payment_info,
      created_by_id,
      updated_by_id,
    } = req.body;
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(user_password, saltRounds);
    const newUser = await client.query(
      "INSERT INTO users (user_name, password_hash, general_status_id, email, phone_number, sale_promocode, payment_info, created_by_id, updated_by_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id",
      [
        user_name,
        hashedPassword,
        general_status_id,
        email,
        phone_number,
        sale_promocode,
        payment_info,
        created_by_id,
        updated_by_id,
      ]
    );

    createSendToken(newUser.rows[0], 201, res);
  } catch (error) {
    // Handle any errors that occur during signup or token creation
    next(error);
  }
});

export const login = catchAsync(async (req, res, next) => {
  const { email, user_password } = req.body;

  //1) check if the email and password exist
  if (!email || !user_password) {
    throw next(new AppError("please type your email and password", 400));
  }
  // 2) check if the user and password are correct
  const user = await client.query(`select * from users where email = '${email}'`);

  if (user.rowCount === 0 || !(await isCorrectPassword(user_password, user.rows[0].password_hash))) {
    throw next(new AppError("Please type e-mail and password correct", 401));
  }

  // console.log(user.rows[0].id);
  // 3) if everything ok, send token to client
  createSendToken(user.rows[0], 200, res);
});

export const forgotPassword = catchAsync(async (req, res, next) => {
  // 1) Get user based on POSTed email
  const getUserQuery = "SELECT * FROM users WHERE email = $1";
  const values = [req.body.email];
  const { rows: users } = await client.query(getUserQuery, values);

  if (users.length === 0) {
    return next(new AppError("User with this email address doesn't exist", 404));
  }

  const user = users[0];

  // 2) Generate the random reset token
  const resetToken = crypto.randomBytes(32).toString("hex");

  const updateTokenQuery = `
    UPDATE users
    SET password_reset_token = $1, password_reset_expires = $2
    WHERE id = $3
  `;

  const tokenExpiration = Date.now() + 10 * 60 * 1000; // 10 minutes
  const updateValues = [resetToken, tokenExpiration, user.id];
  await client.query(updateTokenQuery, updateValues);

  // 3) Send it to user's email
  const resetURL = `${req.protocol}://${req.get("host")}/user/reset-password/${resetToken}`;

  const message = `Forgot your password? Submit a patch request with your new password and passwordConfirm to: ${resetURL}.\n If you didn't forget your password - ignore this email.`;

  try {
    await sendEmail({
      email: user.email,
      subject: "Your password reset token (valid 10 min)",
      message,
    });

    res.status(200).json({
      status: "success",
      message: "Token sent to email!",
    });
  } catch (err) {
    const clearTokenQuery = `
      UPDATE users
      SET password_reset_token = NULL, password_reset_expires = NULL
      WHERE id = $1
    `;

    await client.query(clearTokenQuery, [user.id]);

    return next(new AppError("There was an error sending the email. Try again later!", 500));
  }
});

export const resetPassword = catchAsync(async (req, res, next) => {
  // 1) Get user based on the token
  const hashedToken = crypto.createHash("sha256").update(req.params.token).digest("hex");

  const getUserQuery = `
    SELECT * FROM users
    WHERE password_reset_token = $1 AND password_reset_expires > NOW()
  `;
  const values = [hashedToken];
  const { rows: users } = await client.query(getUserQuery, values);

  if (users.length === 0) {
    return next(new AppError("Token is invalid or has expired!", 400));
  }

  const user = users[0];

  // 2) If token has not expired, and there is user, set the new password
  const saltRounds = 10;
  const hashedPassword = await bcrypt.hash(req.body.password, saltRounds);

  const updateUserQuery = `
    UPDATE users
    SET password = $1, password_confirm = $2,
        password_reset_token = NULL, password_reset_expires = NULL
    WHERE id = $3
  `;

  const updateValues = [hashedPassword, req.body.passwordConfirm, user.id];
  await client.query(updateUserQuery, updateValues);

  // 3) Update changedPasswordAt property for the user
  // Assuming you have a 'changed_password_at' column in your database
  const updateChangedPasswordQuery = `
    UPDATE users
    SET changed_password_at = NOW()
    WHERE id = $1
  `;
  await client.query(updateChangedPasswordQuery, [user.id]);

  // 4) Log the user in, send JWT
  const token = signToken(user.id);

  // Send the token and user details in the response
  res.status(200).json({
    status: "success",
    token,
    user,
  });
});

export const updatePassword = catchAsync(async (req, res, next) => {
  // 1) Get user from database
  const getUserQuery = "SELECT * FROM users WHERE id = $1";
  const values = [req.user.id];
  const { rows: users } = await client.query(getUserQuery, values);

  if (users.length === 0) {
    return next(new AppError("User not found", 404));
  }

  const user = users[0];

  // 2) Check if POSTed current password is correct

  if (!(await isCorrectPassword(req.body.passwordCurrent, user.password))) {
    return next(new AppError("Your current password is wrong!", 401));
  }

  // Update password and passwordConfirm
  const saltRounds = 10;
  const hashedPassword = await bcrypt.hash(req.body.password, saltRounds);

  const updateUserQuery = `
    UPDATE users
    SET password = $1, password_confirm = $2
    WHERE id = $3
  `;

  const updateValues = [hashedPassword, req.body.passwordConfirm, user.id];
  await client.query(updateUserQuery, updateValues);

  // 4) Log user in, send JWT
  const token = signToken(user.id);

  // Send the token and user details in the response
  res.status(200).json({
    status: "success",
    token,
    user,
  });
});
