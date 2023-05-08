const config = require('../db/config');
const mysql =require('mysql');
const util = require('util');
const bcrypt = require('bcrypt');
const User = require('../models/User');
const security = require('../security/config')
module.exports = {
    async list(req, res){
        console.log(req.userInfo)

        const db = mysql.createConnection(config);
        db.connect();
        await db.query('SELECT cpf,name,place,role FROM Users', function(err, rows, fields) {
            if (err) throw err;
            res.json(rows)
        });
        db.end();

    },
    async login(req, res) {
        const {email, password} = req.body;
        const hash = bcrypt.hashSync(password, security.salt)
        const db = mysql.createConnection(config);
        db.connect();
        await db.query('SELECT cpf,name,email, password, place,role FROM Users WHERE email = ?', [email], function(err, rows, fields) {
            if (err) throw err;
            if (rows[0]) {
                const user = JSON.parse(JSON.stringify(rows[0]));
                const isValid = bcrypt.compareSync(password, user.password);
                if (isValid) {
                    const chavePrivada = security.key;
                    const jwt = require('jsonwebtoken');
                    jwt.sign(user, chavePrivada, (err, token) => {
                        if (err) {
                            res
                                .status(500)
                                .json({mensagem: "Erro ao gerar o JWT"});

                            return;
                        }

                        res.status(200).json({token: token});
                        
                    });
                } else {
                    res.status(500).json({data: 'Email ou senha inválidos'})
                }
            }

        });
        db.end();
    },
    async create(req, res){
        const {cpf, place, name, password, email, role} = req.body;
        const db = mysql.createConnection(config);
        db.connect();
        db.query('INSERT INTO Users (cpf, place, name, password, email, role) VALUES (?,?,?,?,?,?)', [cpf, place, name, password, email, role], function (err, result){
            if (err) {
                res
                    .status(500)
                    .json({ mensagem: "Erro ao criar usuário" });

                return;
            }
            res.status(201).json({data: true})
        })
        db.end();

    }
}