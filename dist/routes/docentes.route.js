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
const docente_1 = __importDefault(require("../lib/docente"));
const docenteRoute = express_1.default.Router();
docenteRoute.use(express_1.default.json());
docenteRoute.route("/")
    .get(
/**
 * Obtém todos os docentes.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const docentes = yield docente_1.default.getAll();
            res.send(docentes);
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
 * Insere um novo docente no Banco de dados.
 * @param req
 * @param res
 */
function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
    });
});
docenteRoute.param("id", function (req, res, next, id) {
    req.discente = {
        id: id
    };
    next();
});
docenteRoute.route("/:id")
    .get(function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        res.send({});
    });
});
docenteRoute.param("unidadeAcademica", function (req, res, next, id) {
    req.unidadeAcademica = {
        id: id
    };
    next();
});
docenteRoute.route("/unidade-academica/:unidadeAcademica")
    .get(function (req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const docentes = yield docente_1.default
                .getByUnidadeAcademica(req.unidadeAcademica.id);
            res.send(docentes);
        }
        catch (err) {
            res.send({
                mensagem: "Não foi possível consultar os docentes"
            });
        }
    });
});
exports.default = docenteRoute;
//# sourceMappingURL=docentes.route.js.map