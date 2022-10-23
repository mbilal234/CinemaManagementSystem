const express = require("express");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');

app.set("view-engine", "ejs");

app.use('/CSS',express.static('CSS'));
app.use('/JS',express.static('JS'));
app.use('/images',express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }))

app.get("/", (req, res) =>{
    res.render("index.ejs");
})

app.get("/booking", (req, res) => {
    res.render("Booking.ejs");
})

app.listen(3000, ()=>{
    console.log("Your app is running on http://localhost:3000");
})