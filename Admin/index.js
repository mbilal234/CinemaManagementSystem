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

const ticketType = ["2D", "3D"];
const price = [500, 800];

function insertFilm(res, title, genre, desc_, run_time, rating, cover_img, start_date, end_date) {
    // film_id = parseInt(film_id);
    run_time = parseInt(run_time);
    var values = [[title, genre, desc_, run_time, rating, cover_img, start_date, end_date]];
    fetch("http://localhost:5000/images/" + cover_img).then((res) => {
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
        if (err) throw err;
        res.send("New Screen Added");
    })
}

async function addEmployee(req, res) {
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    const phoneNumber = parseInt(req.body.phone);
    const cnicNumber = parseInt(req.body.cnic);
    var values = [[req.body.firstName, req.body.lastName, req.body.email, phoneNumber, cnicNumber, hashedPassword, req.body.jobTitle, new Date()]]
    con.query("insert into employee (fname, lname, email, phone, cnic, password, jobtitle, hiredate) values (?)", values, (err, result) => {
        if (err) throw err;
        res.send("New Employee Added");
    })
}

async function getEmployee(req, res) {
    const idGiven = req.body.empId;
    const result = await new Promise((resolve) => {
        con.query("SELECT * FROM employee where Emp_ID = (?)", [idGiven], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    if (!result) {
        return res.send("No Employee Available with this id");
    }
    res.render("employeeInfo.ejs", { name: result[0].fName + " " + result[0].lName, email: result[0].Email, phone: result[0].Phone, cnic: result[0].CNIC, jobTitle: result[0].JobTitle, hireDate: result[0].HireDate })
}

async function insertPrices(req, res) {
    const query = "SELECT * FROM ticket_price where (Show_Type_ID in (select Show_Type_ID from show_types where Show_Type = (?)) and (Seat_Type_ID in (select Seat_Type_ID from seat_types where Type = (?))))";
    const result = await new Promise((resolve) => {
        con.query(query, [req.body.showtype, req.body.seattype], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    if (result.length === 0) {
        return res.send("No Ticket present with this show and seat type");
    }
    const data = [req.body.price, req.body.showtype, req.body.seattype];
    const sql = "update ticket_price set Price = (?) where (Show_Type_ID in (select Show_Type_ID from show_types where Show_Type = (?)) and (Seat_Type_ID in (select Seat_Type_ID from seat_types where Type = (?))))";
    con.query(sql, data, (err, result) => {
        if (err) throw err;
        console.log("Ok");
    })
    res.send("Work Done");
}

async function getShowTypes(res) {
    const showTypes = await new Promise((resolve) => {
        con.query("select * from show_types", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const iterator = showTypes.length - 1;
    res.render("showTypes.ejs", { showTypes, iterator });
}

async function addShowType(req, res) {
    con.query("insert into show_types (show_type) values (?)", [[req.body.showType]], (err, reso) => {
        if (err) {
            res.send("Some Problem Occurred")
        } else {
            res.send("Show Inserted");
        }
    })
}

async function getSeatTypes(res) {
    const seatTypes = await new Promise((resolve) => {
        con.query("select * from seat_types", (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    const iterator = seatTypes.length - 1;
    res.render("seatTypes.ejs", { seatTypes, iterator });
}

async function addSeatType(req, res) {
    con.query("insert into seat_types (type) values (?)", [[req.body.seatType]], (err, reso) => {
        if (err) {
            res.send("Some Problem Occurred")
        } else {
            res.send("Seat Inserted");
        }
    })
}

async function createShowPage(req, res) {
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
    res.render("createShow.ejs", { showTypes, iterator, screens, iterator1, films, iterator2 });
}

async function addShow(req, res) {
    if (req.body.film && req.body.screen && req.body.showDate && req.body.startTime && req.body.showType) {
        var values = [[req.body.film, req.body.screen, req.body.showDate, req.body.startTime, req.body.showType]];
        con.query("insert into showtimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) values (?)", values, (err, reso) => {
            if (err) {
                res.send("Some Problem Occurred");
            } else {
                res.send("Show Added");
            }
        })
    }else{
        res.send("One of the fields is missing");
    }
}

async function viewTicketSales(req, res) {
    console.log("Entered ViewTicketSales");
    const year = req.body.form.year;
    console.log(year);
    const result = await new Promise((resolve) => {
        con.query("SELECT MONTHNAME(Res_Time) sales_month, SUM(Price) + SUM(glasses * 200) sales FROM VU_Ticket_Sales WHERE YEAR(Res_Time) = (?) GROUP BY MONTHNAME(Res_Time) ORDER BY MONTH(Res_Time)", [year], (err, res) => {
            if (err) throw err;
            resolve(res);
        })
    })
    return [["January", "200"],["February", "100"]];
}

app.set("view-engine", "ejs");


app.use('/CSS', express.static('CSS'));
app.use('/JS', express.static('JS'));
app.use('/images', express.static('images'));
app.use(bodyParser.urlencoded({ extended: false }));

app.get("/", (req, res) => {
    res.render("index.ejs");
})

app.get("/insertFilm", (req, res) => {
    res.render("insertFilm.ejs");
})

app.post("/insertFilm", (req, res) => {
    insertFilm(res, req.body.filmName, req.body.genre, req.body.desc, req.body.runTime, req.body.rating, req.body.imgUrl, req.body.startDate, req.body.endDate);
})

app.get("/viewFilms", (req, res) => {
    getOptions(res);
})

app.post("/seeMore", (req, res) => {
    openSeeMore(req.body.someName, res);
})

app.get("/addScreen", (req, res) => {
    res.render("newScreens.ejs");
})

app.post("/addScreen", (req, res) => {
    addScreen(req, res);
})

app.get("/addEmployee", (req, res) => {
    res.render("enterEmployee.ejs");
})


app.post("/addEmployee", (req, res) => {
    addEmployee(req, res);
})


app.get("/getEmployee", (req, res) => {
    res.render("enterEmployeeId.ejs");
})

app.post("/getEmployee", (req, res) => {
    getEmployee(req, res);
})

app.get("/prices", (req, res) => {
    const iterator = ticketType.length;
    res.render("prices.ejs", { ticketType, price, iterator });
})

app.post("/updatePrices", (req, res) => {
    insertPrices(req, res);
})

app.get("/createShow", (req, res) => {
    createShowPage(req, res);
})

app.get("/showTypes", (req, res) => {
    getShowTypes(res);
})

app.get("/analytics", (req, res) => {
    res.render("analytics.ejs");
})

app.post("/analytics", (req, res) => {
    req.body.script.barvalues = viewTicketSales(req, user);
})

app.post("/addShowType", (req, res) => {
    addShowType(req, res);
})

app.get("/seatTypes", (req, res) => {
    getSeatTypes(res);
})

app.post("/addSeatType", (req, res) => {
    addSeatType(req, res);
})

app.post("/addShow", (req, res) => {
    addShow(req, res);
})

app.listen(5000, () => {
    console.log("App is listening at port http://localhost:5000");
})