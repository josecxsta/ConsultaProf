import Sequelize from 'sequelize';

const Model = Sequelize.Model;

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
