import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iosd/screens/ChatScreen.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/Buttons.dart';
import 'SignupScreen.dart';
import 'package:iosd/utils/inputBox.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email;
  String password;
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: kPaddingWelcomeScreen,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  child: Padding(
                    padding: kPaddingWelcomeScreen,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Text(
                            kLoginText,
                            style: kTextStyleWelcomeScreen,
                          ),
                        ),
                        SizedBox(
                          height: kSizedBoxWelcomeScreenHeight,
                        ),
                        InputBox(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          hintText: kEmailHintText,
                          onChange: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: kSizedBoxWelcomeScreenHeight,
                        ),
                        InputBox(
                          obscureText: true,
                          hintText: kPasswordHintText,
                          onChange: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: kSizedBoxWelcomeScreenHeight,
                        ),
                        CustomButtons(
                          buttonText: kLoginText,
                          onPressed: () async {

                            setState(() {
                              showSpinner = true;
                            });

                            try {
                              final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                              if (user != null) {
                                Navigator.pushNamed(context, ChatScreen.id);
                              }

                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                        SizedBox(
                          height: kSizedBoxWelcomeScreenHeight,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              kNotAMember,
                              style: kBottomHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
