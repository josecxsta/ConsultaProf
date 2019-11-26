"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const winston_1 = __importDefault(require("winston"));
const logger = winston_1.default.createLogger({
    level: "info",
    format: winston_1.default.format.json(),
    transports: [
        //
        // - Write to all logs with level `info` and below to `combined.log`
        // - Write all logs error (and below) to `error.log`.
        //
        new winston_1.default.transports.File({
            filename: "logs/error.log",
            level: "error"
        }),
        new winston_1.default.transports.File({
            filename: "logs/combined.log"
        }),
    ],
});
logger.add(new winston_1.default.transports.Console({
    format: winston_1.default.format.simple(),
}));
exports.default = logger;
//# sourceMappingURL=logger.js.map