import AvaliacaoDao from "../dao/avaliacao-dao";

/**
 * @class Avaliacao
 * @author José da Costa <josecxsta@gmail.com>
 */
export default class Avaliacao {
    id: number;
    nome: string;
    dataCriacao: Date;
    dataAtualizacao: Date;

    constructor() {
    }

    static async getAll(docente) {
        let avaliacoes;
        await AvaliacaoDao.findOne({ where: {docente: docente} })
            .then(result => {
                avaliacoes = result;
            });
        return avaliacoes;
    }

}
