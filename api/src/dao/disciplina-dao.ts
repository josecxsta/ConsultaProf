const Sequelize = require('sequelize');
import sequelize from '../config/sequelize';

const Model = Sequelize.Model;

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
    sequelize,
    modelName: 'disciplina'
    // options
});

export default DisciplinaDao;
