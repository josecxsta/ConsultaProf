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
const avaliacao_dao_1 = __importDefault(require("../dao/avaliacao-dao"));
/**
 * @class Avaliacao
 * @author José da Costa <josecxsta@gmail.com>
 */
class Avaliacao {
    /**
     * Construtor privado para utilizar no factory.
     * TODO: Método factory
     */
    constructor() {
    }
    /**
     * Obtém todas avaliações de um determinado docente.
     * @param {number} docente
     * @returns {array} avaliacoes
     */
    static getAll(docente) {
        return __awaiter(this, void 0, void 0, function* () {
            let avaliacoes;
            yield avaliacao_dao_1.default.findAll({ where: { docente: docente } })
                .then(result => {
                avaliacoes = result;
            });
            return avaliacoes;
        });
    }
    /**
     * Insere avaliação no banco de dados.
     * @param {object} avaliacao
     * @return response
     */
    static insert(avaliacao) {
        return __awaiter(this, void 0, void 0, function* () {
            let response;
            yield avaliacao_dao_1.default.create(avaliacao)
                .then(result => {
                response = result;
            });
            return response;
        });
    }
}
exports.default = Avaliacao;
//# sourceMappingURL=avaliacao.js.map