import DiscenteDao from "../dao/discente-dao";

/**
* @class Discente
* @author José da Costa <josecxsta@gmail.com>
*/
export default class Discente {
    id: number;
    apelido: string;
    email: string;
    senha: string;
    matricula: string;
    codigoVerificacao: string;
    dataEmissaoVerificacao: Date;
    dataCriacao: Date;
    dataAtualizacao: Date;

    constructor() {
    }

    /**
     * Obtém discente pelo seu id
     * @param {number} id
     * @return {object} discente 
     */
    static async get(id: number) {
        let discente;
        DiscenteDao.findOne({ where: {id: id} })
            .then(result => {
                discente = result;
            });
        return discente;
    }

    /**
     * Obtém todos os discentes do Banco de dados.
     * @returns {Array}
     */
    static async getAll() {
        let discentes;
        await DiscenteDao.findAll().then(result => {
            discentes = result;
        })
            .catch(err => {
                console.error(err);
                discentes = [];
            });
        return discentes;
    }

    /**
     * Insere discente no banco de dados
     * @param {object} discente 
     */
    static async insert(discente) {
        return await DiscenteDao.create(discente);
    }

}

