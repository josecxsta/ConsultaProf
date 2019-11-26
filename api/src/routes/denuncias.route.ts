import express from "express";
import Denuncia from "../lib/denuncia";

const denunciaRoute = express.Router();
denunciaRoute.use(express.json());

denunciaRoute.param("id", function (req: any, res, next, id) {
    req.avaliacao = {
        id: id
    };
    next();
});

denunciaRoute.route("/:id")
    .post(
        /**
         * Envia uma denuncia para uma avaliação.
         * @param req 
         * @param res 
         */
        async function (req: any, res) {
            try {
                await Denuncia.insert(req.avaliacao.id, req.body.email);
                res.send({
                    mensagem: "Denuncia enviada com sucesso."
                });
            } catch (err) {
                res.send({
                    mensagem: "Erro ao enviar denuncia."
                }).status(500);
            }
        });

export default denunciaRoute;
