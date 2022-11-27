const express = require("express");
const fetch = require("node-fetch");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');
const insertCustomer = require("./JS/dml.js")
const insertFilm = require("./JS/ifd.js");
const retrieveFilm = require("./JS/filmRetrieval.js")

app.set("view-engine", "ejs");

app.use('/CSS', express.static('CSS'));
app.use('/JS', express.static('JS'));
app.use('/images', express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }))

async function openSeeMore(film_id, res){
    const result = await retrieveFilm(film_id);
    // fetch(result[0][6]);
    res.render("viewFilm.ejs", {name: result[0].title, cover_img: result[0].cover_img, desc_: result[0].desc_,
    run_time: result[0].run_time, rating: result[0].rating, genre: result[0].genre, start_date: result[0].start_date, 
    end_date: result[0].end_date});
}

app.get("/", (req, res) => {
    res.render("index.ejs");
})

app.get("/booking", (req, res) => {
    res.render("Booking.ejs");
})

app.get("/registerMemberPage", (req, res) => {
    res.render("registerMember.ejs")
})

app.post("/seeMore", (req, res) => {
    openSeeMore(req.body.someName, res);
})

app.post("/signup", (req, res) => {
    insertCustomer(req.body.firstName, req.body.lastName);
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