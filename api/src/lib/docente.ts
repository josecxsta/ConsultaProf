import database from "../config/database";

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

}
