// @ts-ignore
const request =  require("supertest");
import app from "../src/app";

describe("Avaliações do Docente 1", () => {

    describe("GET /avaliacoes/1", () => {
        it("deve retornar 200", () => {
            return request(app)
                .get("/avaliacoes/1")
                .expect(200);
        });
    });

});
