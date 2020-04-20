import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iosd/utils/MessageBubble.dart';
import 'package:iosd/utils/colors.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/inputBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {

  static String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String message;
  FirebaseUser loggedInUser;
  final messageTextController = TextEditingController();

  void getLoggedInUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessageStream() async {
    await for (var snapshot in _firestore.collection("messages").snapshots()) {
      for (var doc in snapshot.documents) {
        print(doc.data);
      }
    }
  }
  
  @override
  void initState() {
    super.initState();
    getLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(kWelcomeText)),
        backgroundColor: AccentColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.clear_thick, color: Colors.white),
            iconSize: 24.0,
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
//                getMessageStream();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              color: PrimaryColor,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection("messages").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AccentColor,
                      ),
                    );
                  }
                  var messages = snapshot.data.documents;
                  List<MessageBubble> messageWidgets = [];
                  for(var message in messages) {
                    final text = message.data['text'];
                    final sender = message.data['sender'];

                    messageWidgets.add(MessageBubble(
                      text: text,
                      sender: sender,
                    ),);
                  }
                  return ListView(
                    padding: EdgeInsets.all(10.0),
                    children: messageWidgets,
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: InputBox(
                    controller: messageTextController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChange: (value) {
                      message = value;
                    },
                    hintText: "Enter your text",
                  ),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.check_mark_circled_solid, color: AccentColor),
                  iconSize: 60.0,
                  onPressed: () {
                    _firestore.collection("messages").add({
                      'text': message,
                      'sender': loggedInUser.email,
                      'time': DateTime.now().toIso8601String()
                    });

                    messageTextController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
