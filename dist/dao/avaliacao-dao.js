"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Sequelize = require("sequelize");
const sequelize_1 = __importDefault(require("../config/sequelize"));
const Model = Sequelize.Model;
/**
 * @class AvaliacaoDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class AvaliacaoDAO extends Model {
}
AvaliacaoDAO.init({
    // attributes
    discente: {
        type: Sequelize.INTEGER
    },
    docente: {
        type: Sequelize.INTEGER
    },
    didatica: {
        type: Sequelize.DOUBLE
    },
    coerencia: {
        type: Sequelize.DOUBLE
    },
    pontualidade: {
        type: Sequelize.DOUBLE
    },
    cordialidade: {
        type: Sequelize.DOUBLE
    },
    comentario: {
        type: Sequelize.STRING
    },
    tituloComentario: {
        type: Sequelize.STRING
    },
    cursariaNovamente: {
        type: Sequelize.BOOLEAN
    },
    disponivel: {
        type: Sequelize.DOUBLE
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize: sequelize_1.default,
    modelName: "avaliacoes"
    // options
});
exports.default = AvaliacaoDAO;
//# sourceMappingURL=avaliacao-dao.js.map