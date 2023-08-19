import { promisify } from "util";
import jwt from "jsonwebtoken";
import catchAsync from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import { client } from "../database.mjs";
import { getWorkerQueryById } from "../utils/queryConstants.js";


export const protect = catchAsync(async (req, res, next) => {
    // 1) getting token and check of it's there
    let token;
    // console.log(req.headers.cookie);
    if (req.headers.cookie && req.headers.cookie.startsWith("jwt=")) {
      token = req.headers.cookie.slice(4);
      // res.send(token);
    }
  
    if (!token) {
      return next(new AppError("You are not logged in! Please log in to get the access", 401));
    }
  
    // 2) Verification this token
    const decoded = await promisify(jwt.verify)(token, process.env.JWT_TOKEN_SECRET);
    // console.log(decoded);
  
    // // 3) Check if user still exists
  
    const values = [decoded.id];
  
    const { rows: currentUser } = await client.query(getWorkerQueryById, values);
  
    if (currentUser.length === 0) {
      return next(new AppError("The user associated with this token does not exist", 404));
    }

  
    // // 4) Check if user changed password after the token was issued
    // if (currentUser.changedPasswordAfter(decoded.iat)) {
    //   return next(new AppError('User recently changed password', 401));
    // }
  
    // // GRANT ACCESS TO PROTECTED ROUTE
    req.user = currentUser;
    next();
  });
  
  
export const restrictTo = (...roles) => {
    return (req, res, next) => {
      if (!roles.includes(req.user.role)) {
        return next(new AppError('You dont have permission', 403));
      }
      next();
    };
  };
  