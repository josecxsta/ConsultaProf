const Sequelize = require('sequelize');
import sequelize from '../config/sequelize';

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
        type: Sequelize.unidadeAcademica
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize,
    modelName: 'docente'
    // options
});

export default DocenteDao;
