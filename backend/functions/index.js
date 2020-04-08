const functions = require('firebase-functions');
const app = require("express")();
const {
  getAllScreams, 
  postOneScream
} = require('./handlers/screams');
const {
  signup, 
  login
} = require('./handlers/users');
const FBAuth = require('./utils/fbAuth');

// screams
app.get("/screams", getAllScreams);

app.post("/screams", FBAuth , postOneScream);

// login and signup routes
// signup
app.post("/signup", signup);

app.post("/login", login);

exports.api = functions.https.onRequest(app);