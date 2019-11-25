import Sequelize from 'sequelize';

const Model = Sequelize.Model;

class AvaliacaoDAO extends Model {}
AvaliacaoDAO.init({
    // attributes
    notaDidatica: {
        type: Sequelize.DOUBLE
    },
    notaCoerencia: {
        type: Sequelize.DOUBLE
    },
    notaPontualidade: {
        type: Sequelize.DOUBLE
    },
    notaCordialidade: {
        type: Sequelize.DOUBLE
    },
    cursariaNovamente: {
        type: Sequelize.BOOLEAN
    },
    mediaNotas: {
        type: Sequelize.DOUBLE
    },
    comentario: {
        type: Sequelize.STRING
    },
    tituloComentario: {
        type: Sequelize.STRING
    },
}, {
    sequelize,
    modelName: 'avaliacaoDAO'
    // options
});

export default AvaliacaoDAO;
