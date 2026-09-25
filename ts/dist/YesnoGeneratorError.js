"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.YesnoGeneratorError = void 0;
class YesnoGeneratorError extends Error {
    isYesnoGeneratorError = true;
    sdk = 'YesnoGenerator';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.YesnoGeneratorError = YesnoGeneratorError;
//# sourceMappingURL=YesnoGeneratorError.js.map