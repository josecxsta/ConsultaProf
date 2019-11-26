import DenunciaDao from "../dao/denuncia-dao";

/**
 * @class Denuncia
 * @author José da Costa <josecxsta@gmail.com>
 */
export default class Denuncia {
    id: number;
    avaliacao: number;
    email: string;
    status: string;
    dataCriacao: Date;
    dataAtualizacao: Date;

    /**
     * Construtor privado para o método factory.
     * TODO: método factory da classe.
     */
    private constructor() {
    }

    /**
     * Insere uma denuncia em uma avaliacao
     * @param {number} avaliacao
     * @param {string} number
     * @returns {object} response
     */
    static async insert(avaliacao: number, email: string) {
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
