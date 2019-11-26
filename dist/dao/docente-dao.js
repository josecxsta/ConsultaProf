"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Sequelize = require("sequelize");
const sequelize_1 = __importDefault(require("../config/sequelize"));
const Model = Sequelize.Model;
/**
 * @class DocenteDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class DocenteDao extends Model {
}
DocenteDao.init({
    // attributes
    nome: {
        type: Sequelize.STRING
    },
    matricula: {
        type: Sequelize.STRING
    },
    unidadeAcademica: {
        type: Sequelize.INTEGER
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize: sequelize_1.default,
    modelName: "docente"
    // options
});
exports.default = DocenteDao;
//# sourceMappingURL=docente-dao.js.map