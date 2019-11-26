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
const avaliacao_1 = __importDefault(require("../lib/avaliacao"));
const avaliacaoRoute = express_1.default.Router();
avaliacaoRoute.use(express_1.default.json());
avaliacaoRoute.route("/")
    .post(
/**
 * Insere nova avaliação no Banco de Dados.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield avaliacao_1.default.insert(req.body);
            res.send({
                mensagem: "Avaliação inserida com sucesso."
            });
        }
        catch (e) {
            res.send({
                mensagem: "Não foi  possível inserir avaliação"
            }).status(500);
        }
    });
});
avaliacaoRoute.param("id", function (req, res, next, id) {
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
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const avaliacoes = yield avaliacao_1.default.getAll(req.docente.id);
            res.send(avaliacoes);
        }
        catch (err) {
            console.error(err);
            res.send({
                mensagem: "Erro ao consultar avaliações"
            }).status(500);
        }
    });
});
exports.default = avaliacaoRoute;
//# sourceMappingURL=avaliacoes.route.js.map