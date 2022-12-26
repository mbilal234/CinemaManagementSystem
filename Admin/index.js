const express = require("express");
const fetch = require("node-fetch");
const app = express();
const path = require("path");
const bodyParser = require('body-parser');
const { MovieDb } = require('moviedb-promise')
const dotenv = require("dotenv");
dotenv.config();
const moviedb = new MovieDb("e9f0a1e64e12aa6748cf8b29b8aa9dcb")

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

const ticketType = ["2D", "3D"];
const price = [500, 800];
const ticketIterator = ticketType.length;

const adminUsername = "admin";
const adminKey = "admin@123";

async function searchMovieResults(req, res) {
    var iterator = 0;
    var movies = [];
    if (req.query.searchQuery) {
        movies = await moviedb.searchMovie(req.query.searchQuery);
        iterator = movies.results.length;
    }
    
    const result = movies.results;
    res.render("insertFilm.ejs", {result, iterator})
}

async function insertMovie(req, res) {
    var movies = [];
    var Trailer_Link = "https://www.youtube.com/watch?v=";
    if (req.body.film_id) {
        movies = await moviedb.movieInfo({id: req.body.film_id} );
        var Trailer_Links = await moviedb.movieVideos({id: req.body.film_id});
        Trailer_Links.results.forEach(element => {
            if (element.name.includes("Trailer") && Trailer_Link == "https://www.youtube.com/watch?v=") {
                Trailer_Link += element.key;
            }
        });
    }

    if (movies) {
        var values = [[movies.id, movies.title, movies.overview, Trailer_Link, movies.runtime, movies.vote_average, movies.poster_path, movies.backdrop_path, req.body.start_date, req.body.end_date]];
        con.query("INSERT INTO films VALUES (?)", values, (err, result) => {
            if (err){  
                console.error("Already Added to Database");
            }
        })

        var genre = [];
        movies.genres.forEach(element => {
            genre.push([movies.id, element.name]);
        });
        
        con.query("INSERT INTO genres VALUES ?", [genre], (err, result) => {
            if (err){  
                console.error(err);
            }
        })
        searchMovieResults(req, res);
    }
}

async function retrieveFilm(film_id) {
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM films where Film_Id = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const imageUrl = await new Promise((resolve) => {
        con.query("SELECT convert(cover_img using utf8) FROM films where Film_ID = (?)", [film_id], (err, res) => {
            if (err) throw err;
            resolve(res)
        })
    })
    // console.log(imageUrl);
    result[0].Cover_Img = "http://localhost:5000/images/" + imageUrl[0]["convert(cover_img using utf8)"];
    return result;
}

function getOptions(res) {
    con.query("SELECT * FROM films", function (err, result, fields) {
        if (err) throw err;
        // console.log(result[0].Title);
        res.render("chooseFilm.ejs", { result: result, iterator: result.length });
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

function addScreen(req, res) {
    var values = [[req.body.screenName, req.body.capacity]];
    console.log(req.body.screenName);
    console.log(req.body.capacity);
    con.query("insert into screens (screen_name, capacity) values (?)", values, (err, result) => {
        if (err){
            res.render("newScreen.ejs", {message: "Some Problem Ocurred"})
        }else{
            res.render("newScreen.ejs", {message: "New Screen Registred"});
        }
    })
}

async function addEmployee(req, res) {
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    const phoneNumber = parseInt(req.body.phone);
    const cnicNumber = parseInt(req.body.cnic);
    var values = [[req.body.firstName, req.body.lastName, req.body.email, phoneNumber, cnicNumber, hashedPassword, req.body.jobTitle, new Date()]]
    con.query("insert into employee (fname, lname, email, phone, cnic, password, jobtitle, hiredate) values (?)", values, (err, result) => {
        if (err){
            res.render("enterEmployee.ejs", {message: "Some Problem Ocurred"});
        }else{
            res.render("enterEmployee.ejs", {message: "New Employee Registered"});
        }
    })
}

async function getAllEmployees(res, message){
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM employee", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    console.log(result);
    let iterator = result.length-1;
    // while(iterator>=0){
    //     console.log(result[iterator].Emp_ID);
    //     console.log(result[iterator].fName+" "+result[iterator].lName);
    //     console.log(result[iterator--].JobTitle);
    // }
    res.render("enterEmployeeId.ejs", {result, iterator, message})
}

async function getEmployee(req, res) {
    const idGiven = req.body.empId;
    let result = await new Promise((resolve) => {
        con.query("SELECT * FROM employee where Emp_ID = (?)", [idGiven], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    if (!result) {
        return res.render("enterEmployeeId.ejs", {result, iterator, message:"No Employee Available with this ID"});
    }
    console.log(idGiven);
    result = result.filter(()=>{return result[0].Emp_ID==idGiven});
    console.log(result);
    const iterator = 0;
    res.render("enterEmployeeId.ejs", {result, iterator, message:""})
}

async function insertPrices(req, res) {
    const query = "SELECT * FROM ticket_price where (Show_Type_ID in (select Show_Type_ID from show_types where Show_Type = (?)) and (Seat_Type_ID in (select Seat_Type_ID from seat_types where Type = (?))))";
    const result = await new Promise((resolve) => {
        con.query(query, [req.body.showtype, req.body.seattype], (err, res) => {
            if (err){
                res.render("prices.ejs", { ticketType, price, iterator, message:"Some Problem Ocurred" });
            };
            resolve(res);
        })
    })
    if (result.length === 0) {
        return res.render("prices.ejs", { ticketType, price, iterator, message:"No Ticket Present with this seat or show type"});
    }
    const data = [req.body.price, req.body.showtype, req.body.seattype];
    const sql = "update ticket_price set Price = (?) where (Show_Type_ID in (select Show_Type_ID from show_types where Show_Type = (?)) and (Seat_Type_ID in (select Seat_Type_ID from seat_types where Type = (?))))";
    con.query(sql, data, (err, result) => {
        if (err){
            res.render("prices.ejs", { ticketType, price, iterator, message:"Some Problem Ocurred" });
        };
        console.log("Ok");
    })
    res.render("prices.ejs", { ticketType, price, iterator, message:"Prices Updated" });
}

async function getShowTypes(res, message) {
    const showTypes = await new Promise((resolve) => {
        con.query("select * from show_types", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const iterator = showTypes.length - 1;
    res.render("showTypes.ejs", { showTypes, iterator, message });
}

async function addShowType(req, res) {
    con.query("insert into show_types (show_type) values (?)", [[req.body.showType]], (err, reso) => {
        if (err) {
            getShowTypes(res, "Some Problem Ocurred");
        } else {
            getShowTypes(res, "New Show Type Created");
        }
    })
}

async function getSeatTypes(res, message) {
    const seatTypes = await new Promise((resolve) => {
        con.query("select * from seat_types", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const iterator = seatTypes.length - 1;
    res.render("seatTypes.ejs", { seatTypes, iterator, message });
}

async function addSeatType(req, res) {
    con.query("insert into seat_types (type) values (?)", [[req.body.seatType]], (err, reso) => {
        if (err) {
            getSeatTypes(res, "Some Problem Ocurred")
        } else {
            getSeatTypes(res, "New Seat Type Created")
        }
    })
}

async function createShowPage(req, res, message) {
    const films = await new Promise((resolve) => {
        con.query("select * from films", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const showTypes = await new Promise((resolve) => {
        con.query("select * from show_types", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const screens = await new Promise((resolve) => {
        con.query("select * from screens", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const iterator2 = films.length - 1;
    const iterator = showTypes.length - 1;
    const iterator1 = screens.length - 1;
    res.render("createShow.ejs", { showTypes, iterator, screens, iterator1, films, iterator2, message });
}

async function addShow(req, res) {
    if (req.body.film && req.body.screen && req.body.showDate && req.body.startTime && req.body.showType) {
        var values = [[req.body.film, req.body.screen, req.body.showDate, req.body.startTime, req.body.showType]];
        con.query("insert into showtimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) values (?)", values, (err, reso) => {
            if (err) {
                createShowPage(req, res, "Some Problem Ocurred");
            } else {
                createShowPage(req, res, "The Show has been scheduled");
            }
        })
    }else{
        createShowPage(req, res, "One of the required fields");
    }
}

async function viewTicketSales(req, res) {
    var year = 0;
    if (req.body.form) {
        year = req.body.form.year;
    }
    
    const result = await new Promise((resolve) => {
        con.query("SELECT MONTHNAME(Res_Time) sales_month, SUM(Price) + SUM(glasses * 200) sales FROM VU_Ticket_Sales WHERE YEAR(Res_Time) = (?) GROUP BY MONTHNAME(Res_Time) ORDER BY MONTH(Res_Time)", [year], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    
    if (!result) {
        result = [["January", "200"],["February", "100"]];
    }
    console.log(result)
    res.render("analytics.ejs", {result}  );
    //return ;
}

app.set("view-engine", "ejs");


app.use('/CSS', express.static('CSS'));
app.use('/JS', express.static('JS'));
app.use('/images', express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }));

app.get("/", (req, res) => {
    res.render("adminLogin.ejs", {message:""});
})

app.post("/login", (req, res) => {
    if (req.body.username==adminUsername && req.body.password==adminKey){
        res.render("index.ejs")
    }else{
        res.render("adminLogin.ejs", {message:"Invalid Credentials"});
    }
})

app.get("/viewFilms", (req, res) => {
    getOptions(res);
})

app.post("/seeMore", (req, res) => {
    openSeeMore(req.body.someName, res);
})

app.get("/addScreen", (req, res) => {
    res.render("newScreens.ejs", {message: ""});
})

app.post("/addScreen", (req, res) => {
    addScreen(req, res);
})

app.get("/addEmployee", (req, res) => {
    res.render("enterEmployee.ejs", {message: ""});
})


app.post("/addEmployee", (req, res) => {
    addEmployee(req, res);
})


app.get("/viewEmployees", (req, res) => {
    getAllEmployees(res, "");
})

app.post("/getEmployee", (req, res) => {
    getEmployee(req, res);
})

app.get("/prices", (req, res) => {
    res.render("prices.ejs", { ticketType, price, iterator: ticketIterator, message:"" });
})

app.post("/updatePrices", (req, res) => {
    insertPrices(req, res);
})

app.get("/createShow", (req, res) => {
    createShowPage(req, res, "");
})

app.get("/showTypes", (req, res) => {
    getShowTypes(res, "");
})

app.get("/analytics", (req, res) => {
    console.log(req);
    viewTicketSales(req, res);
})

app.post("/analytics", (req, res) => {
    viewTicketSales(req, res);
})

app.post("/addShowType", (req, res) => {
    addShowType(req, res, "");
})

app.get("/seatTypes", (req, res) => {
    getSeatTypes(res, "");
})

app.post("/addSeatType", (req, res) => {
    addSeatType(req, res);
})

app.post("/addShow", (req, res) => {
    addShow(req, res);
})

app.get("/insertFilm", (req, res) => {
    searchMovieResults(req, res);
})

app.get("/insertFilm/:searchQuery", (req, res) => {
    console.log(req.params.searchQuery);
    searchMovieResults(req, res);
})

app.post("/insertFilm", (req, res) => {
    insertMovie(req, res);
})



app.listen(5000, () => {
    console.log("App is listening at port http://localhost:5000");
})