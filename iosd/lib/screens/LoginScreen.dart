import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/Buttons.dart';
import 'SignupScreen.dart';
import 'package:iosd/utils/inputBox.dart';

class LoginScreen extends StatefulWidget {

  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        hintText: kEmailHintText,
                      ),
                      SizedBox(
                        height: kSizedBoxWelcomeScreenHeight,
                      ),
                      InputBox(
                        hintText: kPasswordHintText,
                      ),
                      SizedBox(
                        height: kSizedBoxWelcomeScreenHeight,
                      ),
                      CustomButtons(
                        buttonText: kLoginText,
                        onPressed: () {},
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
    );
  }
}
