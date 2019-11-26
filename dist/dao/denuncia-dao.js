"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Sequelize = require("sequelize");
const sequelize_1 = __importDefault(require("../config/sequelize"));
const Model = Sequelize.Model;
/**
 * @class DenunciaDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class DenunciaDao extends Model {
}
DenunciaDao.init({
    avaliacao: {
        type: Sequelize.INTEGER,
    },
    email: {
        type: Sequelize.STRING
    },
    status: {
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
    modelName: "denuncias"
});
exports.default = DenunciaDao;
//# sourceMappingURL=denuncia-dao.js.map