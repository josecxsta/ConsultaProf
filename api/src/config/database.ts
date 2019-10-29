import mysql from "promise-mysql";

/**
 * @author José da Costa <josecxsta@gmail.com>
 */

const dbConfig = {
    host: process.env.CP_DB_HOST,
    user: process.env.CP_DB_USER,
    password: process.env.CP_DB_PASS,
    database: process.env.CP_DB_NAME,
    connectionLimit: 100
};

const connection = mysql.createPool(dbConfig);

export default connection;
