import express from "express";
import Avaliacao from "../lib/avaliacao";

const avaliacaoRoute = express.Router();
avaliacaoRoute.use(express.json());

avaliacaoRoute.route("/")
    .post(async function (req: any, res) {
        res.send({});
    });

avaliacaoRoute.param("id", function (req: any, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});

avaliacaoRoute.route("/:id")
    .get(async function (req: any, res) {
        res.send({});
    });

export default avaliacaoRoute;
