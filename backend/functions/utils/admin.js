const admin = require('firebase-admin');
const serviceAccount = require("../../iosd-149b9-firebase-adminsdk-fs2xu-58d579b985.json")

var adminConfig = {
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://iosd-149b9.firebaseio.com"
}
 // Initialize admin
admin.initializeApp(adminConfig); 

const db = admin.firestore();

module.exports = {admin, db};