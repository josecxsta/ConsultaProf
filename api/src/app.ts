/**
* @file app main use case.
* @author José da Costa <josecxsta@gmail.com>
*/

// modules
import express from "express";
import compression from "compression";
import cors from "cors";
import helmet from "helmet";

// primary endpoints route
import discentes from "./routes/discentes.route";
import docentes from "./routes/docentes.route";
import avaliacoes from "./routes/avaliacoes.route";

const app = express();

app.use(cors(), helmet(), compression());
app.disable("x-powered-by");

app.get("/", function(req, res) {
    res.status(400).json({message: "Bad Request"});
});

app.use("/discentes/", discentes);
app.use("/docentes/", docentes);
app.use("/avaliacoes/", avaliacoes);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    logger.info(`Server listening on port ${PORT}...`);
});

export default app;