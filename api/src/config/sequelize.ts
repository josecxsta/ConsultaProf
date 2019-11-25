const Sequelize = require('sequelize');

const database = {
    host: process.env.CP_DB_HOST,
    user: process.env.CP_DB_USER,
    password: process.env.CP_DB_PASS,
    name: process.env.CP_DB_NAME,
    connectionLimit: 100
};

const sequelize = new Sequelize(database.name, database.user, database.password, {
    host: database.host,
    dialect: "mysql",
    define: {
        timestamps: false
    }
});

sequelize
    .authenticate()
    .then(() => {
        console.log("Connection has been established successfully.");
    })
    .catch(err => {
        console.error("Unable to connect to the database:", err);
    });

export default sequelize;
