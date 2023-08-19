import { client } from "../database.mjs";
import { logger } from "../logs/logger.js";

export const requestToDb = async function (req, res, funcName, doneDdescription, errorDescription) {
    await client
      .query(funcName(req, res), [...Object.values(req.body)])
      .then((result) => {
        logger.info(doneDdescription, result.rows);
        res.send(result.rows);
      })
      .catch((error) => {
        console.error(errorDescription, error);
      });
  };