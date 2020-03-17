const functions = require('firebase-functions');
const admin = require('firebase-admin');

var firebaseConfig = {
    apiKey: "AIzaSyCvYzIoJDegzFdPGcAHCBFtXshx-Ee7vWI",
    authDomain: "iosd-149b9.firebaseapp.com",
    databaseURL: "https://iosd-149b9.firebaseio.com",
    projectId: "iosd-149b9",
    storageBucket: "iosd-149b9.appspot.com",
    messagingSenderId: "97523930957",
    appId: "1:97523930957:web:6f89b452c11d2ce0c00904",
    measurementId: "G-DZWFYHKZCL"
  };

// Initialize Firebase
admin.initializeApp(firebaseConfig);


// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});
