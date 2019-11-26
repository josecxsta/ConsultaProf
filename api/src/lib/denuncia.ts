import DenunciaDao from "../dao/denuncia-dao";

/**
 * @class Denuncia
 * @author José da Costa <josecxsta@gmail.com>
 */
export default class Denuncia {
    id;
    avaliacao;
    email;
    status;
    dataCriacao;
    dataAtualizacao;

    /**
     * Insere uma denuncia em uma avaliacao
     * @param {number} avaliacao
     * @param {string} number
     * @returns {object} response
     */
    static async insert(avaliacao, email) {
        let response;
        await DenunciaDao.create({
            avaliacao: avaliacao,
            email: email
        })
            .then(result => {
                response = result;
            });
        return response;
    }

}
