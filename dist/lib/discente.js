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
const discente_dao_1 = __importDefault(require("../dao/discente-dao"));
/**
* @class Discente
* @author José da Costa <josecxsta@gmail.com>
*/
class Discente {
    /**
     * Construtor privado.
     */
    constructor() {
    }
    /**
     * Obtém discente pelo seu id
     * @param {number} id
     * @return {object} discente
     */
    static get(id) {
        return __awaiter(this, void 0, void 0, function* () {
            let discente;
            discente_dao_1.default.findOne({ where: { id: id } })
                .then(result => {
                discente = result;
            });
            return discente;
        });
    }
    /**
     * Obtém todos os discentes do Banco de dados.
     * @returns {Array}
     */
    static getAll() {
        return __awaiter(this, void 0, void 0, function* () {
            let discentes;
            yield discente_dao_1.default.findAll().then(result => {
                discentes = result;
            })
                .catch(err => {
                console.error(err);
                discentes = [];
            });
            return discentes;
        });
    }
    /**
     * Insere discente no banco de dados
     * @param {object} discente
     */
    static insert(discente) {
        return __awaiter(this, void 0, void 0, function* () {
            return yield discente_dao_1.default.create(discente);
        });
    }
}
exports.default = Discente;
//# sourceMappingURL=discente.js.map