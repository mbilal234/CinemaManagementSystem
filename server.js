const express = require("express");
const fetch = require("node-fetch");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');

app.set("view-engine", "ejs");

app.use('/CSS', express.static('CSS'));
app.use('/JS', express.static('JS'));
app.use('/images', express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }))

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "cinema",
    insecureAuth: true
});

async function openSeeMore(film_id, res) {
    const result = await retrieveFilm(film_id);
    // fetch(result[0][6]);
    res.render("viewFilm.ejs", {
        name: result[0].title, cover_img: result[0].cover_img, desc_: result[0].desc_,
        run_time: result[0].run_time, rating: result[0].rating, genre: result[0].genre, start_date: result[0].start_date,
        end_date: result[0].end_date
    });
}

function insertFilm(film_id, title, genre, desc_, run_time, rating, cover_img, start_date, end_date) {
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

async function retrieveFilm(film_id) {
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM dummy_films where film_id = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res);
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


function getOptions(res) {
    con.query("SELECT * FROM dummy_films", function (err, result, fields) {
        if (err) throw err;
        res.render("booking.ejs", { result: result, iterator: result.length });
        return;
    });
    // console.log(result);
    
}

app.get("/", (req, res) => {
    res.render("index.ejs");
})

app.get("/booking", (req, res) => {
    getOptions(res);
})

app.get("/registerMemberPage", (req, res) => {
    res.render("registerMember.ejs")
})

app.post("/seeMore", (req, res) => {
    openSeeMore(req.body.someName, res);
})

app.post("/signup", (req, res) => {
    console.log("Hello World")
    res.redirect("/booking");
})

app.get("/insert", (req, res) => {
    res.render("insertFilm.ejs");
})

app.post("/filmInsert", (req, res) => {
    insertFilm(req.body.filmId, req.body.filmName, req.body.genre, req.body.desc, req.body.runTime, req.body.rating, req.body.imgUrl, req.body.startDate, req.body.endDate);
    res.redirect("/");
})

app.listen(3000, () => {
    console.log("Your app is running on http://localhost:3000");
})