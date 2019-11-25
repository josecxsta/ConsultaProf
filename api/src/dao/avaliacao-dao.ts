import Sequelize from 'sequelize';

const Model = Sequelize.Model;

class AvaliacaoDAO extends Model {

}

AvaliacaoDAO.init({
    // attributes
    didatica: {
        type: Sequelize.DOUBLE
    },
    coerencia: {
        type: Sequelize.DOUBLE
    },
    pontualidade: {
        type: Sequelize.DOUBLE
    },
    cordialidade: {
        type: Sequelize.DOUBLE
    },
    comentario: {
        type: Sequelize.STRING
    },
    tituloComentario: {
        type: Sequelize.STRING
    },
    cursariaNovamente: {
        type: Sequelize.BOOLEAN
    },
    disponivel: {
        type: Sequelize.DOUBLE
    },
    dataCriacao: {
        type: Sequelize.DATE
    },
    dataAtualizacao: {
        type: Sequelize.DATE
    }
}, {
    sequelize,
    modelName: 'avaliacaoDAO'
    // options
});

export default AvaliacaoDAO;
