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
                await Avaliacao.insert(req.body);
                res.send({
                    mensagem: "Avaliação inserida com sucesso."
                });
            } catch (e) {
                res.send({
                    mensagem: "Não foi  possível inserir avaliação"
                }).status(500);
            }

        });

avaliacaoRoute.param("id", function (req: any, res, next, id) {
    req.docente = {
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
        try {
            const avaliacoes = await Avaliacao.getAll(req.docente.id);
            res.send(avaliacoes);
        } catch (err) {
            console.error(err);
            res.send({
                mensagem: "Erro ao consultar avaliações"
            }).status(500);
        }
    });

export default avaliacaoRoute;
