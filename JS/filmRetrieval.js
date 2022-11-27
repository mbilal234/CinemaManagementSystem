var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "cinema",
    insecureAuth: true
});

async function retrieveFilm(film_id) {
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM dummy_films where film_id = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res)
        })
    })
    const imageUrl = await new Promise((resolve)=>{
        con.query("SELECT convert(cover_img using utf8) FROM dummy_films where film_id = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res)
        })
    })
    // console.log(imageUrl);
    result[0].cover_img = "http://localhost:3000/images/"+imageUrl[0]["convert(cover_img using utf8)"];
    return result;
}

// retrieveFilm(1223);

module.exports = retrieveFilm;


// module.exports = retrieveFilm;