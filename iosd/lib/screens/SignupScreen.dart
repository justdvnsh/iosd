import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/Buttons.dart';
import 'LoginScreen.dart';
import 'package:iosd/utils/inputBox.dart';


class SignupScreen extends StatefulWidget {

  static String id = "signup_screen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                          kSignupText,
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
                        buttonText: kSignupText,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: kSizedBoxWelcomeScreenHeight,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            kAlreadyAMember,
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
