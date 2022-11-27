var fetch = require("node-fetch");

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "cinema",
    insecureAuth: true
});

function insertTheFilm(film_id, title, genre, desc_, run_time, rating, cover_img, start_date, end_date) {
    film_id = parseInt(film_id);
    run_time = parseInt(film_id);
    var values = [[film_id, title, genre, desc_, run_time, rating, cover_img, start_date, end_date]];
    fetch("http://localhost:3000/images/"+cover_img).then((res)=>{
        return res.blob;
    }).then((blob) => {
        values[0][6] = blob;
    });
    con.query("insert into dummy_films (film_id, title, genre, desc_, run_time, rating, cover_img, start_date, end_date) values (?)", values, (err, result) => {
        if (err) {
            console.log(err)
        }
        console.log(result);
    })

}

module.exports = insertTheFilm;