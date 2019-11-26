import AvaliacaoDao from "../dao/avaliacao-dao";

/**
 * @class Avaliacao
 * @author José da Costa <josecxsta@gmail.com>
 */
export default class Avaliacao {
    id;
    nome;
    dataCriacao;
    dataAtualizacao;

    /**
     * Obtém todas avaliações de um determinado docente.
     * @param {number} docente
     * @returns {array} avaliacoes
     */
    static async getAll(docente) {
        let avaliacoes;
        await AvaliacaoDao.findAll({ where: {docente: docente} })
            .then(result => {
                avaliacoes = result;
            });
        return avaliacoes;
    }

    /**
     * Insere avaliação no banco de dados.
     * @param {object} avaliacao
     * @return response
     */
    static async insert(avaliacao) {
        let response;
        await AvaliacaoDao.create(avaliacao)
            .then(result => {
                response = result;
            });
        return response;
    }

}
