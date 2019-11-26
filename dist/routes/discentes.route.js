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
const discente_1 = __importDefault(require("../lib/discente"));
const discenteRoute = express_1.default.Router();
discenteRoute.use(express_1.default.json());
discenteRoute.route("/")
    .get(
/**
 * Obtém todos os discentes.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const discentes = yield discente_1.default.getAll();
            res.send(discentes);
        }
        catch (e) {
            res.send({
                mensagem: "Erro interno"
            }).status(500);
        }
    });
})
    .post(
/**
 * Insere novo discente.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const newDiscente = req.body;
        try {
            yield discente_1.default.insert(newDiscente);
            res.send({
                mensagem: "Discente criado com sucesso!"
            });
        }
        catch (e) {
            res.send(e);
        }
    });
});
discenteRoute.param("id", function (req, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});
discenteRoute.route("/:id")
    .get(
/**
 * Obtém discente pelo seu ID.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        yield discente_1.default.get(req.discente.id);
    });
});
exports.default = discenteRoute;
//# sourceMappingURL=discentes.route.js.map