import express from "express";
import Docente from "../lib/docente";

const docenteRoute = express.Router();
docenteRoute.use(express.json());

docenteRoute.route("/")
    .get(
        /**
         * Obtém todos os docentes.
         * @param req
         * @param res
         */
        async function (req: any, res) {
            try {
                const docentes = await Docente.getAll();
                res.send(docentes);
            } catch (e) {
                res.send({
                    mensagem: "Erro interno"
                }).status(500);
            }
        })
    .post(
        /**
         * Insere um novo docente no Banco de dados.
         * @param req
         * @param res
         */
        async function (req: any, res) {

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

docenteRoute.param("unidadeAcademica", function (req: any, res, next, id) {
    req.unidadeAcademica = {
        id: id
    };
    next();
});

docenteRoute.route("/unidade-academica/:unidadeAcademica")
    .get(
        async function (req: any, res) {
            try {
                const docentes = await Docente
                    .getByUnidadeAcademica(req.unidadeAcademica.id);
                res.send(docentes);
            } catch (err) {
                res.send({
                    mensagem: "Não foi possível consultar os docentes"
                })
            }
        }
    )

export default docenteRoute;
