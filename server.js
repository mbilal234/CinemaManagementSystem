const express = require("express");
const fetch = require("node-fetch");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');
const mailVerification = require("./JS/emailVerify.js");

// Variables Required for email verification
let verificationCode;
let userEmail;
let response;

let emailLoggedIn;

app.set("view-engine", "ejs");

app.use('/CSS', express.static('CSS'));
app.use('/JS', express.static('JS'));
app.use('/images', express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }));

var mysql = require('mysql');
const e = require("express");

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "abdularham123",
    database: "cinema",
    insecureAuth: true
});

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

function insertFilm(title, genre, desc_, run_time, rating, cover_img, start_date, end_date) {
    // film_id = parseInt(film_id);
    run_time = parseInt(run_time);
    var values = [[title, genre, desc_, run_time, rating, cover_img, start_date, end_date]];
    fetch("http://localhost:3000/images/"+cover_img).then((res)=>{
        return res.blob;
    }).then((blob) => {
        values[0][5] = blob;
    });
    con.query("insert into films (title, genres, description, run_time, rating, cover_img, start_date, end_date) values (?)", values, (err, result) => {
        if (err) {
            console.log(err)
        }
        console.log(result);
    })

}

function insertInauthenticatedMember(fname, lname, cnic, email, phone, password){
    phone = parseInt(phone);
    cnic = parseInt(cnic);
    joining_date = new Date();
    var values = [[fname, lname, cnic, email, phone, password, joining_date, false]];
    console.log(values);
    con.query("insert into members (fname, lname, cnic, email, phone, password, joining_date, isauthenticated) values (?)", values, (err, result) => {
        if (err) {
            console.log(err)
        }
        console.log(result);
    })
}

function memberAuthentication(email){
    var update = [true, email];
    console.log(email, true);
    con.query("update members set isauthenticated = (?) where email = (?)", update, (err, result) => {
        if (err) {
            console.log(err)
        }
        console.log(result);
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
    result[0].Cover_Img = "http://localhost:3000/images/"+imageUrl[0]["convert(cover_img using utf8)"];
    return result;
}

async function retrieveMember(email){
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM members where email = (?)", [email], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    return result;
}

async function checkMemberPresent(email, res, req){
    const result = await retrieveMember(email);
    if (result.length === 0){
        insertInauthenticatedMember(req.body.firstName, req.body.lastName, req.body.cnic, req.body.email, req.body.cellNo, req.body.password);
        userVerification(userEmail, response);
    }else{
        res.render("registerMember.ejs", {message: `User with email ${email} already Present`});
    }

}


function getOptions(res) {
    con.query("SELECT * FROM films", function (err, result, fields) {
        if (err) throw err;
        console.log(result[0].Title);
        res.render("booking.ejs", { result: result, iterator: result.length, loggedIn : emailLoggedIn });
        return;
    });
    // console.log(result);
    
}

async function userVerification(receiver, res){
    verificationCode = await mailVerification(receiver);
    res.render("enterCode.ejs", {email: receiver});
}

async function resendMail(receiver){
    verificationCode = await mailVerification(receiver);
}

async function retrieveUser(req, res){
    const emailEntered = req.body.email;
    const passwordEntered = req.body.password;
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM members where email = (?)", [emailEntered], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    if (result.length==1){
        if (result[0].isAuthenticated){
            if (result[0].Password === passwordEntered){
                emailLoggedIn = emailEntered;
                res.redirect("/booking");
            }else{
                res.render("Sign-In.ejs", {message: "Incorrect Password"});
            }
        }else{
            userEmail = emailEntered;
            verificationCode = await mailVerification(emailEntered);
            res.render("enterCode.ejs", {email: emailEntered});
        }
    }else{
        res.render("Sign-In.ejs", {message: "No User With This Email"});
    }
}

app.get("/", (req, res) => {
    res.render("index.ejs");
})

app.get("/about", (req, res) => {
    res.render("About.ejs");
})

app.get("/contact", (req, res) => {
    res.render("Contact.ejs");
})

app.get("/sign-in-page", (req, res) => {
    res.render("Sign-In.ejs", {message: ""})
})

app.get("/booking", (req, res) => {
    getOptions(res);
})

app.get("/registerMemberPage", (req, res) => {
    res.render("registerMember.ejs", {message: ""});
})

app.post("/seeMore", (req, res) => {
    openSeeMore(req.body.someName, res);
})

app.post("/signup", (req, res) => {
    retrieveUser(req, res);
})

app.get("/insert", (req, res) => {
    res.render("insertFilm.ejs");
})

app.post("/filmInsert", (req, res) => {
    console.log(req.body);
    insertFilm(req.body.filmName, req.body.genre, req.body.desc, req.body.runTime, req.body.rating, req.body.imgUrl, req.body.startDate, req.body.endDate);
    res.redirect("/");
})

app.post("/verify", (req, res) => {
    userEmail = req.body.email;
    response = res;
    console.log(req.body.cellNo);
    checkMemberPresent(userEmail, res, req);
})

app.post("/codeEntered", (req, res) => {
    console.log("No error Yet 1");
    console.log(verificationCode);
    // let ver = verificationCode.toString();
    console.log("No error Yet 2");
    let codeEntered = parseInt(req.body.digit_1+req.body.digit_2+req.body.digit_3+req.body.digit_4+req.body.digit_5+req.body.digit_6);
    console.log("No error Yet 3");
    console.log(codeEntered);
    let verified = codeEntered===verificationCode?true:false;
    console.log(verified);
    if (verified){
        memberAuthentication(userEmail);
    }
    res.render("verificationSuccess.ejs", {verificationStatus: verified?"Your Account Is Made!":"Incorrect Code Entered", action:verified?"/":"/registerMemberPage", buttonText: verified?"Done":"Register Again"});
    // res.render("verificationSuccess.ejs");
    
})

app.post("/resend/:userEmail", (req, res) => {
    console.log(userEmail);
    resendMail(userEmail);
    res.render("enterCode.ejs", {email: userEmail})
})

app.get("/logout", (req, res)=>{
    emailLoggedIn = "";
    res.render("Sign-In.ejs", {message: ""})
})

app.listen(3000, () => {
    console.log("Your app is running on http://localhost:3000");
})