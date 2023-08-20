import { promisify } from "util";
import jwt from "jsonwebtoken";
import catchAsync from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import { client } from "../database.mjs";
import { getWorkerQueryById, getUserQueryById } from "../utils/queryConstants.js";

export const protect = catchAsync(async (req, res, next) => {
  // 1) getting token and check of it's there
  let token;
  if (req.headers.cookie && req.headers.cookie.startsWith("jwt=")) {
    token = req.headers.cookie.slice(4);
  }

  if (!token) {
    return next(new AppError("You are not logged in! Please log in to get the access", 401));
  }

  // 2) Verification this token
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_TOKEN_SECRET);
  // console.log(decoded);

  // 3) Check if user still exists

  const values = [decoded.id];

  const { rows: currentWorker } = await client.query(getWorkerQueryById, values);

  if (currentWorker.length === 0) {
    return next(new AppError("The user associated with this token does not exist", 404));
  }

  const { rows: currentUser } = await client.query(getUserQueryById, values);

  if (currentWorker[0].email === currentUser[0].email) {
    return next(new AppError("You are just regular user, you dont have a permisions for it", 404));
  }

  //Implement this logic later

  // 4) Check if user changed password after the token was issued
  // if (currentUser.changedPasswordAfter(decoded.iat)) {
  //   return next(new AppError('User recently changed password', 401));
  // }

  // // GRANT ACCESS TO PROTECTED ROUTE

  req.user = currentWorker;
  next();
});

export const restrictTo = (...roles) => {
  // console.log(...roles);
  return (req, res, next) => {
    console.log(req.user[0]);
    if (!roles.includes(req.user[0].role_id)) {
      return next(new AppError("You dont have permission", 403));
    }
    next();
  };
};
