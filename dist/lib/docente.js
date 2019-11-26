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
const docente_dao_1 = __importDefault(require("../dao/docente-dao"));
/**
 * @class Docente
 * @author José da Costa <josecxsta@gmail.com>
 */
class Docente {
    constructor() {
    }
    /**
     * Obtém todos os docentes do Banco de dados.
     * @returns {Array}
     */
    static getAll() {
        return __awaiter(this, void 0, void 0, function* () {
            let docentes;
            yield docente_dao_1.default.findAll().then(result => {
                docentes = result;
            })
                .catch(err => {
                console.error(err);
                docentes = [];
            });
            return docentes;
        });
    }
    /**
     * Obtém todos os docentes de determinada unidade academica.
     * @param {number} unidadeAcademica
     * @returns {Array}
     */
    static getByUnidadeAcademica(unidadeAcademica) {
        return __awaiter(this, void 0, void 0, function* () {
            let docentes;
            yield docente_dao_1.default.findAll({ where: { unidadeAcademica: unidadeAcademica } })
                .then(result => {
                docentes = result;
            })
                .catch(err => {
                console.error(err);
                docentes = [];
            });
            return docentes;
        });
    }
}
exports.default = Docente;
//# sourceMappingURL=docente.js.map