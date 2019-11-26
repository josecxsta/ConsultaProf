import DiscenteDao from "../dao/discente-dao";
import Crypto from "crypto-js";

/**
* @class Discente
* @author José da Costa <josecxsta@gmail.com>
*/
export default class Discente {
    id;
    apelido;
    email;
    senha;
    matricula;
    codigoVerificacao;
    dataEmissaoVerificacao;
    dataCriacao;
    dataAtualizacao;

    /**
     * Obtém discente pelo seu id
     * @param {number} id
     * @return {object} discente
     */
    static async get(id) {
        let discente;
        DiscenteDao.findOne({ where: {id: id} })
            .then(result => {
                discente = result;
            });
        return discente;
    }

    /**
     * Atualiza determinado discente no banco de dados.
     * @param {object} discente
     */
    static async update(discente) {
        return await DiscenteDao.update(discente);
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
        discente.senha = Crypto.SHA256(discente.senha, discente.email);
        return await DiscenteDao.create(discente);
    }

}

