import jwt from "jsonwebtoken";
import { DAY } from "../utils/constants.js";

export const signToken = (id, type) => {
  return jwt.sign({ id, type }, process.env.JWT_TOKEN_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

export const createSendToken = (user, type, statusCode, res) => {
  const token = signToken(user.id, type);

  res.cookie("token", token, {
    expires: new Date(Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * DAY),
    secure: process.env.NODE_ENV === "production",
    httpOnly: true,
  });

  // remove the password from the output
  user.user_password = undefined;

  res.status(statusCode).json({
    status: "success",
    token,
    data: {
      user,
    },
  });
};