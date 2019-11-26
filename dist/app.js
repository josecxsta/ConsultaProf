"use strict";
/**
* @file app main use case.
* @author José da Costa <josecxsta@gmail.com>
*/
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
// modules
const express_1 = __importDefault(require("express"));
const compression_1 = __importDefault(require("compression"));
const cors_1 = __importDefault(require("cors"));
const helmet_1 = __importDefault(require("helmet"));
const logger_1 = __importDefault(require("./config/logger"));
// primary endpoints route
const discentes_route_1 = __importDefault(require("./routes/discentes.route"));
const docentes_route_1 = __importDefault(require("./routes/docentes.route"));
const avaliacoes_route_1 = __importDefault(require("./routes/avaliacoes.route"));
const denuncias_route_1 = __importDefault(require("./routes/denuncias.route"));
const unidades_academicas_route_1 = __importDefault(require("./routes/unidades-academicas.route"));
const app = express_1.default();
app.use(cors_1.default(), helmet_1.default(), compression_1.default(), express_1.default.json());
app.disable("x-powered-by");
app.get("/", function (req, res) {
    res.status(200)
        .json({ mensagem: "ConsultaProf está funcionando!" });
});
app.use("/discentes/", discentes_route_1.default);
app.use("/docentes/", docentes_route_1.default);
app.use("/avaliacoes/", avaliacoes_route_1.default);
app.use("/denuncias/", denuncias_route_1.default);
app.use("/unidades-academicas/", unidades_academicas_route_1.default);
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    logger_1.default.info(`Server listening on port ${PORT}...`);
});
exports.default = app;
//# sourceMappingURL=app.js.map