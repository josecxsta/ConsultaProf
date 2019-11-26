import UnidadeAcademicaDao from "../dao/unidade-academica-dao";
import { response } from "express";

/**
 * @class UnidadeAcademica
 * @author José da Costa <josecxsta@gmail.com>
 */
export default class UnidadeAcademica {
    id: number;
    nome: string;
    unidadeAcademica: number;
    dataCriacao: Date;
    dataAtualizacao: Date;

    /**
     * Construtor privado para ser utilizado no factory method.
     */
    private constructor() {
    }

    /**
     * Obtém todas as UnidadeAcademicas do Banco de dados.
     * @returns {Array}
     */
    static async getAll() {
        let unidadesAcademicas;
        await UnidadeAcademicaDao.findAll().then(result => {
            unidadesAcademicas = result;
        })
            .catch(err => {
                console.error(err);
                unidadesAcademicas = [];
            });
        return unidadesAcademicas;
    }

    /**
     * Insere nova unidade acadêmica no banco de dados.
     * @param {object} unidadeAcademica 
     */
    static async insert(unidadeAcademica) {
        let response;
        await UnidadeAcademicaDao.create(unidadeAcademica)
            .then(result => {
                response = result;
            });
        return response;
    }

}
