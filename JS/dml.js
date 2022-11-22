var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "academics",
    insecureAuth: true
});

function insertCustomer(first_name, last_name){
    con.query(`insert into students values (${first_name}, ${last_name}, 4)`, (err, result, fields) => {
        if (err) {
            console.log(err)
        }
        console.log(result);
    })
}

module.exports = insertCustomer;