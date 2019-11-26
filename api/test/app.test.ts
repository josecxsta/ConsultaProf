// @ts-ignore
const request =  require("supertest");
import app from "../src/app";

describe("App Endpoint Test", () => {

    describe("GET /", () => {
        it("should return 200 OK", () => {
            return request(app)
                .get("/")
                .expect(200);
        });
    });

});
