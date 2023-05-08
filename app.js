const express = require("express");
const app = express();
const cors = require('cors')
const port = process.env.PORT || 3001;

const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(cors({
    origin: '*'
}));

app.get("/api", (req, res) => res.type('json').send({name: 'tiago'}));


app.use('/v1/api', require("./src/routes"));
app.listen(port, () => console.log(`listening on port ${port}!`));

module.exports=app;


