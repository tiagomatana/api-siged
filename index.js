const db = require('./src/db/config');

db.connect();
db.query('SELECT * FROM Users', function(err, rows, fields) {
    if (err) throw err;
    console.log(rows[0].name);
});
db.end();