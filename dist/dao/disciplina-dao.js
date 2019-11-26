"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Sequelize = require("sequelize");
const sequelize_1 = __importDefault(require("../config/sequelize"));
const Model = Sequelize.Model;
/**
 * @class DisciplinaDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class DisciplinaDao extends Model {
}
DisciplinaDao.init({
    // attributes
    nome: {
        type: Sequelize.STRING
    },
    codigo: {
        type: Sequelize.STRING
    },
    unidadeAcademica: {
        type: Sequelize.INTEGER
    },
    ano: {
        type: Sequelize.INT
    },
    semestre: {
        type: Sequelize.INT
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize: sequelize_1.default,
    modelName: "disciplina"
    // options
});
exports.default = DisciplinaDao;
//# sourceMappingURL=disciplina-dao.js.map