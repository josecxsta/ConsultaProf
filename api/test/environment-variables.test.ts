describe("Teste de variáveis de ambiente", () => {
    test("Credeciais do Banco de dados", () => {
        expect(process.env.CP_DB_HOST.length).toBeGreaterThan(0);
        expect(process.env.CP_DB_USER.length).toBeGreaterThan(0);
        expect(process.env.CP_DB_PASS.length).toBeGreaterThan(0);
        expect(process.env.CP_DB_NAME.length).toBeGreaterThan(0);
    });
});
