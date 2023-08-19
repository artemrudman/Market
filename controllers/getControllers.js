import { requestToDb } from "../helpers/requestsToDB.js";

const generatorSelectRequest = (tableName) => `SELECT * FROM ${tableName}`;

const getAllFromEachDBQuery = (req, res) => generatorSelectRequest(req.path.slice(1));

export const getAllWorkers = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllRoles = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllBranches = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllGeneralStatuses = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllBranchStatuses = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllStorageTypes = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllProductTypes = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllConditionStatuses = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllOrderStatuses = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getWorkerStatuses = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getAllDeliverymanStatuses = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getShelfs = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getOrders = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getDeliverymans = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getItems = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");

export const getUsers = async (req, res) =>
  await requestToDb(req, res, getAllFromEachDBQuery, "All workers below:", "Error inserting data:");
