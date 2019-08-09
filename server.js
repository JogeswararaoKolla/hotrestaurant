// Dependencies
// =============================================================
var express = require("express");
var path = require("path");

// Sets up the Express App
// =============================================================
var app = express();
var PORT = 3000;

// Sets up the Express app to handle data parsing
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const Reservation=[];
const ReservationWaitlist=[];



// Routes
// =============================================================

// Basic route that sends the user first to the AJAX Page
app.get("/", function(req, res) {
  res.sendFile(path.join(__dirname, "index.html"));
});

app.get("/tables", function(req, res) {
    res.sendFile(path.join(__dirname, "viewTable.html"));
  });
  
  app.get("/reserve", function(req, res) {
    res.sendFile(path.join(__dirname, "index.html"));
  });
  


// Displays all characters
app.post("/api/tables", function(req, res) {
    console.log(req.body);
    let newReservation = {};
    newReservation.customerName=req.body.customerName;
    newReservation.phoneNumber=req.body.phoneNumber;
    newReservation.customerEmail=req.body.customerEmail;
    newReservation.customerID=req.body.customerID;
     let confirmation="";
    if(Reservation.length < 5){
        Reservation.push(newReservation);
        console.log(Reservation);
        confirmation=true;
    }
    else {
        ReservationWaitlist.push(newReservation);
        console.log(ReservationWaitlist);
        confirmation=false;
    }
    res.send(confirmation);
});

app.get("/api/tables",function(req,res){
    res.send(Reservation);
});

app.get('/api/waitlist',function(req,res){
    res.send(ReservationWaitlist);
});
// Starts the server to begin listening
// =============================================================
app.listen(PORT, function() {
  console.log("App listening on PORT " + PORT);
});
