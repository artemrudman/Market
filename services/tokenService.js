import jwt from "jsonwebtoken";
import { DAY } from "../utils/constants.js";

export const signToken = (id) => {
    return jwt.sign({ id }, process.env.JWT_TOKEN_SECRET, {
      expiresIn: process.env.JWT_EXPIRES_IN,
    });
  };
  
export const createSendToken = (user, statusCode, res) => {
    const token = signToken(user.id);
    const cookieOptions = {
      expires: new Date(Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * DAY),
      //secure: true,
      httpOnly: true,
    };
  
    if (process.env.NODE_ENV === "production") {
      cookieOptions.secure = true;
    }
  
    res.cookie("jwt", token, cookieOptions);
  
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