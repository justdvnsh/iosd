import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iosd/utils/colors.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/inputBox.dart';

class ChatScreen extends StatefulWidget {

  static String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

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
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              color: PrimaryColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputBox(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChange: (value) {},
                    hintText: "Enter your text",
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                GestureDetector(
                    child: Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      size: 70.0,
                      color: AccentColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
