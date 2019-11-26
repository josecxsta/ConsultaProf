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
const unidade_academica_1 = __importDefault(require("../lib/unidade-academica"));
const uaRoute = express_1.default.Router();
uaRoute.route("/")
    .get(
/**
 * Obtém todos as unidades acadêmicas.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uas = yield unidade_academica_1.default.getAll();
            res.send(uas);
        }
        catch (e) {
            res.send({
                mensagem: "Erro ao consultar unidades acadêmicas."
            }).status(500);
        }
    });
})
    .post(
/**
 * Insere uma nova unidade academica no Banco de dados.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const newDiscente = req.body;
        try {
            yield unidade_academica_1.default.insert(newDiscente);
            res.send({
                mensagem: "Unidade Acadêmica criado com sucesso!"
            });
        }
        catch (err) {
            console.error(err);
            res.send({
                mensagem: "Erro ao inserir Unidade Acadêmica"
            }).status(500);
        }
    });
});
exports.default = uaRoute;
//# sourceMappingURL=unidades-academicas.route.js.map