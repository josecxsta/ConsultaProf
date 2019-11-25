import Sequelize from 'sequelize';

const Model = Sequelize.Model;

class DenunciaDao extends Model {

}

DenunciaDao.init({
    // attributes
    avaliacao: {
        type: Sequelize.avaliacao,
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
