const functions = require('firebase-functions');
const admin = require('firebase-admin');
const serviceAccount = require("../iosd-149b9-firebase-adminsdk-fs2xu-58d579b985.json")
const firebase = require("firebase");
const express = require("express");
const app = express();

var firebaseConfig = {
    apiKey: "AIzaSyCvYzIoJDegzFdPGcAHCBFtXshx-Ee7vWI",
    authDomain: "iosd-149b9.firebaseapp.com",
    databaseURL: "https://iosd-149b9.firebaseio.com",
    projectId: "iosd-149b9",
    storageBucket: "iosd-149b9.appspot.com",
    messagingSenderId: "97523930957",
    appId: "1:97523930957:web:6f89b452c11d2ce0c00904",
    measurementId: "G-DZWFYHKZCL",
  };

var adminConfig = {
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://iosd-149b9.firebaseio.com"
}

// Initialize Firebase
admin.initializeApp(adminConfig);

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

const db = admin.firestore();

app.get("/screams", (request, response) => {
  db.collection("screams")
  .orderBy("createdAt", "desc").get()
  .then((data) => {
    let screams = [];
    data.forEach((doc) => screams.push({
      screamId: doc.id,
      userHandle: doc.data().userHandle,
      body: doc.data().body,
      createdAt: doc.data().createdAt
    }));
    return response.json(screams);
  }).catch(e => console.log(e))
});

const FBAuth = (request, response, next) => {

  let idToken;
  if (request.headers.authorization && request.headers.authorization.startsWith("Bearer ")) {
    idToken = request.headers.authorization.split("Bearer ")[1];
  } else {
    console.log("No Token Found")
    return response.status(403).json({error: "Unauthorized"})
  }

  admin.auth().verifyIdToken(idToken)
  .then(decodedToken => {
    request.user = decodedToken;
    return db.collection("users").where("userId", "==", request.user.uid).limit(1).get();
  }).then(data => {
    request.user.handle = data.docs[0].data().handle;
    return next();
  })
  .catch(e => {
    console.log("Error while verifying token ", e);
    return response.status(403).json(e);
  })

}

app.post("/screams", FBAuth ,(request, response) => { 
  const newScream = {
    userHandle: request.user.handle,
    body: request.body.body,
    createdAt: new Date().toISOString()
  }
  db.collection("screams").add(newScream)
  .then((data) => {
    return response.json({"message": `document ${data.id} created succesfully !`});
  }).catch(e =>  {
    console.log(e)
    return response.status(500).json({error: "internal server error"});
  })
})

const isEmpty = (string) => {
  if (string.trim() === "") return true
  else return false;
}

const ValidateData = (error) => {
  const errors = {}
  for (e in error) {
    if (isEmpty(error[e])) errors[e] = "Must Not Be Empty";
  }

  return errors;
}

// login and signup routes
// signup
app.post("/signup", (request, response) => {
  const newUser = {
    email: request.body.email,
    password: request.body.password,
    confirmPassword: request.body.confirmPassword,
    handle: request.body.handle
  };

  // TODO: Validate
  const errors = ValidateData(newUser);
  if (newUser.password !== newUser.confirmPassword) errors.password = "Password Must match";
  if (Object.keys(errors).length > 0) return response.status(400).json({errors});

  let token, userId;
  db.doc(`/users/${newUser.handle}`).get()
  .then((doc) => {
    if (doc.exists) {
      return response.status(400).json({handle: "This handle is aleady taken"});
    } else {
      return firebase.auth().createUserWithEmailAndPassword(newUser.email, newUser.password);
    }
  }).then((data) => {
    userId = data.user.uid;
    return data.user.getIdToken();
  }).then((idToken) => {
    token = idToken;
    const userCreds = {
      handle: newUser.handle,
      email: newUser.email,
      createdAt: new Date().toISOString(),
      userId
    }
    return db.doc(`/users/${newUser.handle}`).set(userCreds);
  }).then(() => {
    return response.status(201).json({token});
  })
  .catch(e => {
    console.log(e);
    return response.json({error : e.code});
  })
})

app.post("/login", (request, response) => {
  const user = {
    email: request.body.email,
    password: request.body.password
  }

  // Validate;
  const errors = ValidateData(user);
  if (Object.keys(errors).length > 0) return response.status(400).json({errors});

  firebase.auth().signInWithEmailAndPassword(user.email, user.password)
  .then(data => data.user.getIdToken())
  .then(token => response.json({token}))
  .catch(e => {
    console.log(e);
    if (e.code === "auth/wrong-password") return response.status(400).json({general: "Wrong Creds"})
    else return response.status(500).json({error: e.code});
  })
})

exports.api = functions.https.onRequest(app);