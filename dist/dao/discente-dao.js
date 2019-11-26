"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Sequelize = require("sequelize");
const sequelize_1 = __importDefault(require("../config/sequelize"));
const Model = Sequelize.Model;
/**
 * @class DiscenteDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class DiscenteDao extends Model {
}
DiscenteDao.init({
    // attributes
    apelido: {
        type: Sequelize.STRING,
    },
    email: {
        type: Sequelize.STRING
    },
    senha: {
        type: Sequelize.STRING
    },
    matricula: {
        type: Sequelize.STRING
    },
    codigoVerificacao: {
        type: Sequelize.STRING
    },
    dataEmissaoVerificacao: {
        type: Sequelize.DATE
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize: sequelize_1.default,
    modelName: "discente"
    // options
});
exports.default = DiscenteDao;
//# sourceMappingURL=discente-dao.js.map