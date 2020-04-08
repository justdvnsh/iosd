const {db} = require('../utils/admin');

exports.getAllScreams = (request, response) => {
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
};

exports.postOneScream = (request, response) => { 
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
};
