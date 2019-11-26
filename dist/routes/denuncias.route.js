"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const denuncia_1 = __importDefault(require("../lib/denuncia"));
const denunciaRoute = express_1.default.Router();
denunciaRoute.use(express_1.default.json());
denunciaRoute.param("id", function (req, res, next, id) {
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
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield denuncia_1.default.insert(req.avaliacao.id, req.body.email);
            res.send({
                mensagem: "Denuncia enviada com sucesso."
            });
        }
        catch (err) {
            res.send({
                mensagem: "Erro ao enviar denuncia."
            }).status(500);
        }
    });
});
exports.default = denunciaRoute;
//# sourceMappingURL=denuncias.route.js.map