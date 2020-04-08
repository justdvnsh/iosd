const functions = require('firebase-functions');
const app = require("express")();
const {
  getAllScreams, 
  postOneScream
} = require('./handlers/screams');
const {
  signup, 
  login,
  imageUpload
} = require('./handlers/users');
const FBAuth = require('./utils/fbAuth');

// screams
// get screams
app.get("/screams", getAllScreams);

// post a scream
app.post("/screams", FBAuth , postOneScream);

// users
// signup
app.post("/signup", signup);

// login
app.post("/login", login);

// image upload
app.post("/user/image", FBAuth, imageUpload);

exports.api = functions.https.onRequest(app);