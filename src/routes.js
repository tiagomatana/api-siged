const express = require('express');
const routes = express.Router();
const auth = require('./middleware')
const UserController = require('./controllers/UserController');





// routes.post(`${PREFIX}/login`, UserController.login)
// routes.post(`${PREFIX}/logout`, UserController.login)
routes.get('/users', auth, UserController.list);
routes.post('/login', UserController.login);
routes.post('/users', UserController.create);

module.exports = routes;