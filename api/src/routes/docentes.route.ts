import express from "express";
import Docente from "../lib/docente";

const docenteRoute = express.Router();
docenteRoute.use(express.json());

docenteRoute.route("/")
    .get(async function (req: any, res) {
        res.send({});
    });

docenteRoute.param("id", function (req: any, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});

docenteRoute.route("/:id")
    .get(async function (req: any, res) {
        res.send({});
    });

export default docenteRoute;
