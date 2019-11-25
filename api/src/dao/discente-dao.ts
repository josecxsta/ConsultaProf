import Sequelize from 'sequelize';

const Model = Sequelize.Model;

class DiscenteDao extends Model {}
DiscenteDao.init({
    // attributes
    apelido: {
        type: Sequelize.STRING,
    },
    email: {
        type: Sequelize.STRING
    },
    senha: {
        type: Sequelize.STRING
    },
    matricula: {
        type: Sequelize.STRING
    },
    codigoVerificacao: {
        type: Sequelize.STRING
    },
    dataEmissaoVerificacao: {
        type: Sequelize.DATE
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize,
    modelName: 'discente'
    // options
});

export default DiscenteDao;
