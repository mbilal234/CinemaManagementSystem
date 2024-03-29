const express = require("express");
const fetch = require("node-fetch");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');
const mailVerification = require("./JS/emailVerify.js");
const bcrypt = require('bcrypt');
const dotenv = require("dotenv")
dotenv.config();

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
    console.log(result[0].Title)
    console.log(film_id);
    res.render("viewFilm.ejs", {
        name: result[0].Title, cover_img: result[0].Cover_Img, desc_: result[0].Description,
        run_time: result[0].Run_Time, rating: result[0].Rating, genre: result[0].Genre, start_date: result[0].Start_Date,
        end_date: result[0].End_Date, filmID: film_id
    });
}


async function insertInauthenticatedMember(fname, lname, cnic, email, phone, password){
    phone = parseInt(phone);
    const hashedPassword = await bcrypt.hash(password, 10);
    cnic = parseInt(cnic);
    joining_date = new Date();
    var values = [[fname, lname, cnic, email, phone, hashedPassword, joining_date, false]];
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
    filmTitle = result[0].Title;
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
        // console.log(result[0].Title);
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
    // const hashedPassword = await bcrypt.hash(req.body.password, 10);
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM members where email = (?)", [emailEntered], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    if (result.length==1){
        if (result[0].isAuthenticated){
            const passCorrect = await bcrypt.compare(req.body.password, result[0].Password);
            if (passCorrect){
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

async function retrievShows(req, res){
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM showtimes where Film_ID = (?)", [req.params.filmID], (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    const iterator = result.length-1;
    for (let i=0; i<=iterator; i++){
        const showType = await new Promise((resolve) => {
            con.query("SELECT Show_Type FROM show_types where Show_Type_ID = (?)", [result[i].Show_Type_ID], (err, reso) => {
                if (err) throw err;
                resolve(reso);
            })
        })
        console.log(showType[0].Show_Type)
        result[i].Show_Type_ID = showType[0].Show_Type;
    }
    res.render("viewShows.ejs", {title: req.params.title, result, iterator});
}

async function bookReservation(req, res){
    console.log(emailLoggedIn)
    const memberId = await new Promise((resolve) => {
        con.query("SELECT * FROM members where Email = (?)", [emailLoggedIn], (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    const memberID = memberId[0].Member_ID;
    con.query("insert into reservations (Show_ID) values (?)", [[req.params.showID]], (err, reso)=>{
        if (err) throw err;
    })
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM reservations", (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    const resID = result[result.length-1].Res_ID;
    con.query("insert into member_reservation (Member_ID, Res_ID) values (?)", [[memberID, resID]], (err, reso)=>{
        if (err) throw err;
    })
    res.send("Your Booking Is Done and the Payment has been made");
}

async function Retrieve_Coming_Soon_Now_Showing(req, res){
    const CS = await new Promise((resolve) => {
        con.query("SELECT Poster, Trailer_Link FROM VU_Coming_Soon",  (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    const iterator_CS = CS.length-1;

    const NS = await new Promise((resolve) => {
        con.query("SELECT Film_ID, Title, Description, YEAR(Start_Date) AS Year, Trailer_Link, Poster, Backdrop FROM VU_Now_Showing",  (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    const iterator_NS = NS.length-1;   
    res.render("index.ejs", {CS, iterator_CS, NS, iterator_NS});
}

async function retrieveFilmDescription(req, res) {
    const result = await new Promise((resolve) => {
        con.query("SELECT Film_ID, Title, Description, Trailer_Link, Run_Time, Rating, Poster, Backdrop, DAYOFWEEK(CURDATE()) AS Day, CURDATE() AS Date FROM films where Film_ID = (?)", [req.params.id], (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })

    const genres = await new Promise((resolve) => {
        con.query("SELECT Genre FROM genres where Film_ID = (?)", [req.params.id], (err, reso) => {
        
            if (err) throw err;
            resolve(reso);
        })
    })
    
    const showtimes = await new Promise((resolve) => {
        con.query("SELECT Show_ID, Show_Date, Start_Time, Show_Type FROM vu_shows where Film_ID = (?) AND Show_Date >= CURDATE()", [req.params.id], (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    console.log(genres);

    res.render("filmDescription.ejs", {result, genres, showtimes});
}
async function retrieveSeats(req, res) {
    const seats = await new Promise((resolve) => {
        con.query("SELECT * FROM VU_ShowSeats WHERE Show_ID = (?)", [req.params.showID], (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })

    const reserved = await new Promise((resolve) => {
        con.query("SELECT * FROM VU_ReservedSeats WHERE Show_ID = (?)", [req.params.showID], (err, reso) => {
            if (err) throw err;
            resolve(reso);
        })
    })
    
    

    res.render("seatingPlan.ejs", {seats, reserved});
}

app.get("/", (req, res) => {
    Retrieve_Coming_Soon_Now_Showing(req, res);
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

app.get("/viewFilm/:id", (req, res) => {
    retrieveFilmDescription(req, res);
})

app.get("/seatPlan/:showID", (req, res) => {
    retrieveSeats(req, res);
})

app.post("/seeMore", (req, res) => {
    openSeeMore(req.body.someName, res);
})

app.post("/signup", (req, res) => {
    retrieveUser(req, res);
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

app.get("/getShows/:title/:filmID", (req, res)=>{
    retrievShows(req, res);
})

app.get("/bookTicket/:showID", (req, res) => {
    bookReservation(req, res);
})

app.listen(3000, () => {
    console.log("Your app is running on http://localhost:3000");
})