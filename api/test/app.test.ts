// @ts-ignore
const request =  require("supertest");
import app from "../src/app";

describe("Teste requisição a raíz", () => {

    describe("GET /", () => {
        it("deve retornar 200 OK", () => {
            return request(app)
                .get("/")
                .expect(200);
        });
    });

});
