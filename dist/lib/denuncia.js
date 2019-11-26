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
const denuncia_dao_1 = __importDefault(require("../dao/denuncia-dao"));
/**
 * @class Denuncia
 * @author José da Costa <josecxsta@gmail.com>
 */
class Denuncia {
    /**
     * Construtor privado para o método factory.
     * TODO: método factory da classe.
     */
    constructor() {
    }
    /**
     * Insere uma denuncia em uma avaliacao
     * @param {number} avaliacao
     * @param {string} number
     * @returns {object} response
     */
    static insert(avaliacao, email) {
        return __awaiter(this, void 0, void 0, function* () {
            let response;
            yield denuncia_dao_1.default.create({
                avaliacao: avaliacao,
                email: email
            })
                .then(result => {
                response = result;
            });
            return response;
        });
    }
}
exports.default = Denuncia;
//# sourceMappingURL=denuncia.js.map