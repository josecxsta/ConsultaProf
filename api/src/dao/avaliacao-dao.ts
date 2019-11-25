const Sequelize = require("sequelize");
import sequelize from "../config/sequelize";

const Model = Sequelize.Model;

/**
 * @class AvaliacaoDao
 * @author João Carlos Fonseca <fonseca.jc@live.com>
 */
class AvaliacaoDAO extends Model {

}

AvaliacaoDAO.init({
    // attributes
    discente: {
        type: Sequelize.INTEGER
    },
    docente: {
        type: Sequelize.INTEGER
    },
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
    modelName: "avaliacoes"
    // options
});

export default AvaliacaoDAO;
