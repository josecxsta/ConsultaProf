/**
* @file app main use case.
* @author José da Costa <josecxsta@gmail.com>
*/

// modules
import express from "express";
import compression from "compression";
import cors from "cors";
import helmet from "helmet";
import logger from "./config/logger";

// primary endpoints route
import discentes from "./routes/discentes.route";
import docentes from "./routes/docentes.route";
import avaliacoes from "./routes/avaliacoes.route";
import denuncias from "./routes/denuncias.route";
import unidadesAcademicas from "./routes/unidades-academicas.route";

const app = express();

app.use(cors(), helmet(), compression(), express.json());
app.disable("x-powered-by");

app.get("/", function(req, res) {
    res.status(200)
        .json({mensagem: "ConsultaProf está funcionando!"});
});

app.use("/discentes/", discentes);
app.use("/docentes/", docentes);
app.use("/avaliacoes/", avaliacoes);
app.use("/denuncias/", denuncias);
app.use("/unidades-academicas/", unidadesAcademicas);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    logger.info(`Server listening on port ${PORT}...`);
});

export default app;
