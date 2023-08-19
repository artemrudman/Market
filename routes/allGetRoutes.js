import express from "express";
import {
    getAllWorkers,
    getAllRoles,
    getAllBranches,
    getAllGeneralStatuses,
    getAllBranchStatuses,
    getAllStorageTypes,
    getAllProductTypes,
    getAllConditionStatuses,
    getAllOrderStatuses,
    getWorkerStatuses,
    getAllDeliverymanStatuses,
    getShelfs,
    getOrders,
    getDeliverymans,
    getItems,
    getUsers
} from "../controllers/getControllers.js";

export const getRouter = express.Router();

const routes = [
  { path: "/workers", handler: getAllWorkers },
  { path: "/roles", handler: getAllRoles },
  { path: "/branches", handler: getAllBranches },
  { path: "/general_statuses", handler: getAllGeneralStatuses },
  { path: "/branch_statuses", handler: getAllBranchStatuses },
  { path: "/storage_types", handler: getAllStorageTypes },
  { path: "/product_types", handler: getAllProductTypes },
  { path: "/condition_statuses", handler: getAllConditionStatuses },
  { path: "/order_statuses", handler: getAllOrderStatuses },
  { path: "/worker_statuses", handler: getWorkerStatuses },
  { path: "/deliveryman_statuses", handler: getAllDeliverymanStatuses },
  { path: "/shelfs", handler: getShelfs },
  { path: "/orders", handler: getOrders },
  { path: "/deliverymans", handler: getDeliverymans },
  { path: "/items", handler: getItems },
  { path: "/users", handler: getUsers },
];

routes.forEach((route) => {
    getRouter.route(route.path).get(route.handler);
});