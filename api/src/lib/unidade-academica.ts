import UnidadeAcademicaDao from "../dao/unidade-academica-dao";

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

    constructor() {
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

}
