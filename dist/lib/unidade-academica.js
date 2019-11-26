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
const unidade_academica_dao_1 = __importDefault(require("../dao/unidade-academica-dao"));
/**
 * @class UnidadeAcademica
 * @author José da Costa <josecxsta@gmail.com>
 */
class UnidadeAcademica {
    /**
     * Construtor privado para ser utilizado no factory method.
     */
    constructor() {
    }
    /**
     * Obtém todas as UnidadeAcademicas do Banco de dados.
     * @returns {Array}
     */
    static getAll() {
        return __awaiter(this, void 0, void 0, function* () {
            let unidadesAcademicas;
            yield unidade_academica_dao_1.default.findAll().then(result => {
                unidadesAcademicas = result;
            })
                .catch(err => {
                console.error(err);
                unidadesAcademicas = [];
            });
            return unidadesAcademicas;
        });
    }
    /**
     * Insere nova unidade acadêmica no banco de dados.
     * @param {object} unidadeAcademica
     */
    static insert(unidadeAcademica) {
        return __awaiter(this, void 0, void 0, function* () {
            let response;
            yield unidade_academica_dao_1.default.create(unidadeAcademica)
                .then(result => {
                response = result;
            });
            return response;
        });
    }
}
exports.default = UnidadeAcademica;
//# sourceMappingURL=unidade-academica.js.map