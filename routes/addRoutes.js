import express from "express";
import {
  addWorker,
  addRole,
  addBranch,
  addGeneralStatus,
  addBranchStatus,
  addStorageType,
  addProductType,
  addConditionStatus,
  addOrderStatus,
  addWorkerStatus,
  addDeliverymanStatus,
  addShelf,
  addOrder,
  addDeliveryman,
  addItem,
  addUser,
} from "../controllers/addControllers.js";
import { protect } from "../services/protectEndpoints.js";

export const insertRouter = express.Router();

const routes = [
  { path: "/workers", handler: addWorker },
  { path: "/roles", handler: addRole },
  { path: "/branches", handler: addBranch },
  { path: "/general_statuses", handler: addGeneralStatus },
  { path: "/branch_statuses", handler: addBranchStatus },
  { path: "/storage_types", handler: addStorageType },
  { path: "/product_types", handler: addProductType },
  { path: "/condition_statuses", handler: addConditionStatus },
  { path: "/order_statuses", handler: addOrderStatus },
  { path: "/worker_statuses", handler: addWorkerStatus },
  { path: "/deliveryman_statuses", handler: addDeliverymanStatus },
  { path: "/shelfs", handler: addShelf },
  { path: "/orders", handler: addOrder },
  { path: "/deliverymans", handler: addDeliveryman },
  { path: "/items", handler: addItem },
  { path: "/users", handler: addUser },
];

routes.forEach((route) => {
  insertRouter.route(route.path).post(protect, route.handler);
});
