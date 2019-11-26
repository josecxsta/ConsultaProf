// @ts-ignore
import request from "supertest";
import app from "../src/app";

describe("Avaliações do Docente 1", () => {

    describe("GET /avaliacoes/1", () => {
        it("deve retornar 200", () => {
            return request(app)
                .get("/avaliacoes/1")
                .expect(200);
        });
    });

    describe("GET /avaliacoes/2", () => {
        it("deve retornar 200", () => {
            return request(app)
                .get("/avaliacoes/2")
                .expect(200);
        });
    });

});
