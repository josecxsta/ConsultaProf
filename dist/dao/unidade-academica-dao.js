"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Sequelize = require("sequelize");
const sequelize_1 = __importDefault(require("../config/sequelize"));
const Model = Sequelize.Model;
/**
 * @class UnidadeAcademicaDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class UnidadeAcademicaDao extends Model {
}
UnidadeAcademicaDao.init({
    // attributes
    nome: {
        type: Sequelize.STRING
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize: sequelize_1.default,
    modelName: "unidadesacademicas"
    // options
});
exports.default = UnidadeAcademicaDao;
//# sourceMappingURL=unidade-academica-dao.js.map