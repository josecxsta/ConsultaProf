import express from "express";
import Discente from "../lib/discente";

const discenteRoute = express.Router();
discenteRoute.use(express.json());

discenteRoute.route("/")
.get(async function (req: any, res) {
    try {
        const discentes = await Discente.getAll();
        res.send(discentes);
    } catch (e) {
        res.send({
        mensagem: "Erro interno"
        }).status(500);
    }
})
.post(async function (req: any, res) {
    const newDiscente = req.body;
    try {
        await Discente.insert(newDiscente);
        res.send({
            mensagem: "Discente criado com sucesso!"
        });
    } catch (e) {
        res.send(e);
    }
});

discenteRoute.param("id", function (req: any, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});

discenteRoute.route("/:id")
.get(async function (req: any, res) {
    res.send({});
});

export default discenteRoute;
