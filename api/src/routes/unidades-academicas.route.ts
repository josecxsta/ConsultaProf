import express from "express";
import UnidadeAcademica from "../lib/unidade-academica";

const uaRoute = express.Router();

uaRoute.route("/")
    .get(
        /**
         * Obtém todos as unidades acadêmicas.
         * @param req
         * @param res
         */
        async function (req: any, res) {
            try {
                const uas = await UnidadeAcademica.getAll();
                res.send(uas);
            } catch (e) {
                res.send({
                    mensagem: "Erro ao consultar unidades acadêmicas."
                }).status(500);
            }
        })
    .post(
        /**
         * Insere uma nova unidade academica no Banco de dados.
         * @param req
         * @param res
         */
        async function (req: any, res) {

        });


export default uaRoute;
