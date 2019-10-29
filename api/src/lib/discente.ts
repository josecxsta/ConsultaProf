import database from "../config/database";

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



}
