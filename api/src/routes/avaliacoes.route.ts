import express from "express";
import Avaliacao from "../lib/avaliacao";

const avaliacaoRoute = express.Router();
avaliacaoRoute.use(express.json());

avaliacaoRoute.route("/")
    .post(
    /**
     * Insere nova avaliação no Banco de Dados.
     * @param req
     * @param res
     */
        async function (req: any, res) {
            try {
                console.log(req.body);
                await Avaliacao.insert(req.body);
                res.send({
                    mensagem: "Avaliação inserida com sucesso."
                });
            } catch (e) {
                res.send({
                    mensagem: "Não foi possível inserir avaliação"
                }).status(500);
            }

        });

avaliacaoRoute.param("id", function (req: any, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});


avaliacaoRoute.route("/:id")
    .get(
    /**
     * Obtém todas as avaliações de um docente.
     * @param req
     * @param res
     */
        async function (req: any, res) {
            const avaliacoes = await Avaliacao.getAll(req.discente.id);
            res.send(avaliacoes);
        });

export default avaliacaoRoute;
