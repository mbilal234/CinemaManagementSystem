var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "academics",
    insecureAuth: true
});

function insertCustomer(first_name, last_name){
    var values = [[first_name, last_name, 4]]
    con.query(`insert into students (first_name, last_name, cgpa) values (?)`, values, (err, result) => {
        if (err) {
            console.log(err)
        }
        console.log(result);
    })
}

module.exports = insertCustomer;