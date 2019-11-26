import DocenteDao from "../dao/docente-dao";

/**
 * @class Docente
 * @author José da Costa <josecxsta@gmail.com>
 */
export default class Docente {
    id: number;
    nome: string;
    unidadeAcademica: number;
    dataCriacao: Date;
    dataAtualizacao: Date;

    constructor() {
    }

    /**
     * Obtém todos os docentes do Banco de dados.
     * @returns {Array}
     */
    static async getAll() {
        let docentes;
        await DocenteDao.findAll().then(result => {
            docentes = result;
        })
        .catch(err => {
            console.error(err);
            docentes = [];
        });
        return docentes;
    }

    /**
     * Obtém todos os docentes de determinada unidade academica.
     * @param {number} unidadeAcademica
     * @returns {Array}
     */
    static async getByUnidadeAcademica(unidadeAcademica) {
        let docentes;
        await DocenteDao.findAll({ where: { unidadeAcademica: unidadeAcademica}})
        .then(result => {
            docentes = result;
        })
        .catch(err => {
            console.error(err);
            docentes = [];
        });
        return docentes;
    }

}
