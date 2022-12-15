const express = require("express");
const fetch = require("node-fetch");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');
// const mailVerification = require("./JS/emailVerify.js");
const bcrypt = require('bcrypt');

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "cinema",
    insecureAuth: true
});

function insertFilm(res, title, genre, desc_, run_time, rating, cover_img, start_date, end_date) {
    // film_id = parseInt(film_id);
    run_time = parseInt(run_time);
    var values = [[title, genre, desc_, run_time, rating, cover_img, start_date, end_date]];
    fetch("http://localhost:5000/images/"+cover_img).then((res)=>{
        return res.blob;
    }).then((blob) => {
        values[0][5] = blob;
    });
    con.query("insert into films (title, genres, description, run_time, rating, cover_img, start_date, end_date) values (?)", values, (err, result) => {
        if (err) {
            console.log(err)
            res.send("Could Not Insert The Film");
        }
        console.log(result);
        res.send("Film Inserted");
    })

}

async function retrieveFilm(film_id) {
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM films where Film_Id = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const imageUrl = await new Promise((resolve)=>{
        con.query("SELECT convert(cover_img using utf8) FROM films where Film_ID = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res)
        })
    })
    // console.log(imageUrl);
    result[0].Cover_Img = "http://localhost:5000/images/"+imageUrl[0]["convert(cover_img using utf8)"];
    return result;
}

function getOptions(res) {
    con.query("SELECT * FROM films", function (err, result, fields) {
        if (err) throw err;
        // console.log(result[0].Title);
        res.render("chooseFilm.ejs", { result: result, iterator: result.length});
        return;
    });
    // console.log(result);
    
}

async function openSeeMore(film_id, res) {
    console.log(film_id);
    const result = await retrieveFilm(film_id);
    // fetch(result[0][6]);
    res.render("viewFilm.ejs", {
        name: result[0].Title, cover_img: result[0].Cover_Img, desc_: result[0].Description,
        run_time: result[0].Run_Time, rating: result[0].Rating, genre: result[0].Genre, start_date: result[0].Start_Date,
        end_date: result[0].End_Date
    });
}

app.set("view-engine", "ejs");


app.use('/CSS', express.static('CSS'));
app.use('/JS', express.static('JS'));
app.use('/images', express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }));

app.get("/", (req, res)=> {
    res.render("index.ejs");
})

app.get("/insertFilm", (req, res)=> {
    res.render("insertFilm.ejs");
})

app.post("/insertFilm", (req, res)=> {
    insertFilm(res, req.body.filmName, req.body.genre, req.body.desc, req.body.runTime, req.body.rating, req.body.imgUrl, req.body.startDate, req.body.endDate);
})

app.get("/viewFilms", (req, res)=>{
    getOptions(res);
})

app.post("/seeMore", (req, res)=>{
    openSeeMore(req.body.someName, res);
})

app.listen(5000, ()=>{
    console.log("App is listening at port http://localhost:5000");
})