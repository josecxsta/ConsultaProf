const Sequelize = require('sequelize');
import sequelize from '../config/sequelize';

const Model = Sequelize.Model;

/**
 * @class DenunciaDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class DenunciaDao extends Model {

}

DenunciaDao.init({
    // attributes
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
    sequelize,
    modelName: 'denuncia'
    // options
});

export default DenunciaDao;
