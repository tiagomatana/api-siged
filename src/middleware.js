const middlewareValidarJWT = (req, res, next) => {
    const jwt = req.headers["authorization"];
    const chavePrivada = "@c0mpa3";

    // Efetuando a validação do JWT:
    const jwtService = require("jsonwebtoken");
    jwtService.verify(jwt, chavePrivada, (err, userInfo) => {
        if (err) {
            res.status(403).end();
            return;
        }
        req.userInfo = userInfo;
        next();
    });
};


module.exports = middlewareValidarJWT;