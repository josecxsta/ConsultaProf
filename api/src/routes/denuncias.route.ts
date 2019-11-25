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
.post(async function (req: any, res) {
  res.send({});
});

export default denunciaRoute;
