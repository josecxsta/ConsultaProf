import express from "express";
import Discente from "../lib/discente";

const discenteRoute = express.Router();
discenteRoute.use(express.json());

discenteRoute.route("/")
    .post(async function (req: any, res) {
        res.send({});
    });

discenteRoute.param("id", function (req: any, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});

discenteRoute.route("/:id")
    .get(async function (req: any, res) {
        res.send(await Discente.getById(req.discente.id));
    });

export default discenteRoute;
