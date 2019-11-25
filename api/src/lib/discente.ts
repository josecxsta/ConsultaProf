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

    static async get(email: string) {
        DiscenteDao.findOne({ where: {email: email} })
        .then(project => {
        });
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

    static async insert(obj) {

    }


}
