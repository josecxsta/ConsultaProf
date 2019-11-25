import Sequelize from 'sequelize';

const Model = Sequelize.Model;

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
    sequelize,
    modelName: 'unidadeAcademica'
    // options
});

export default UnidadeAcademicaDao;
