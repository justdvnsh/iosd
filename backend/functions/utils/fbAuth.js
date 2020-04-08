const {admin, db} = require('./admin');

module.exports = (request, response, next) => {

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
  
};