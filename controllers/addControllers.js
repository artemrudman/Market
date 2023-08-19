import { requestToDb } from "../helpers/requestsToDB.js";

const generatorInsertRequest = (req, res, tableName) => {
  const expectedBody = [...Object.keys(req.body)];
  return `INSERT INTO ${tableName} (
    ${expectedBody}
  )
  VALUES (${[expectedBody.map((el, i) => (el = `$${i + 1}`))]})
  
  RETURNING id, ${expectedBody}
  `;
};

const addAllBodyFromDBQuery = (req, res) => generatorInsertRequest(req, res, req.path.slice(1));

export const addWorker = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "Worker was inserted:", "Error inserting data:");

export const addRole = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New role was inserted:", "Error inserting data:");

export const addBranch = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New branch was inserted:", "Error inserting data:");

export const addGeneralStatus = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New general status was inserted:", "Error inserting data:");

export const addBranchStatus = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New branch status was inserted:", "Error inserting data:");

export const addStorageType = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New storage type was inserted:", "Error inserting data:");

export const addProductType = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New product type was inserted:", "Error inserting data:");

export const addConditionStatus = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New condition status was inserted:", "Error inserting data:");

export const addOrderStatus = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New order status was inserted:", "Error inserting data:");

export const addWorkerStatus = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New worker status was inserted:", "Error inserting data:");

export const addDeliverymanStatus = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New delivry status was inserted:", "Error inserting data:");

export const addShelf = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New shelf was inserted:", "Error inserting data:");

export const addOrder = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New order was inserted:", "Error inserting data:");

export const addDeliveryman = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New deliveryman was inserted:", "Error inserting data:");

export const addItem = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New item was inserted:", "Error inserting data:");

export const addUser = async (req, res) =>
  await requestToDb(req, res, addAllBodyFromDBQuery, "New user was inserted:", "Error inserting data:");

export const addUserNew = async (req, res) =>
  await requestToDb(
    req,
    res,
    (req, res) => generatorInsertRequest(req, res, 'users'),
    "New user was inserted:",
    "Error inserting data:"
  );
