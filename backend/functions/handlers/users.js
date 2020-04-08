const firebase = require('firebase');
const {db} = require('../utils/admin');
const {firebaseConfig} = require('../utils/config');
const {ValidateData} = require('../utils/validators');

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

exports.signup = (request, response) => {
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
};

exports.login = (request, response) => {
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
};