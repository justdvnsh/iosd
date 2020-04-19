import 'package:flutter/material.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/Buttons.dart';
import 'LoginScreen.dart';
import 'SignupScreen.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: kPaddingWelcomeScreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  kWelcomeText,
                  style: kTextStyleWelcomeScreen,
                ),
              ),
              SizedBox(
                height: kSizedBoxWelcomeScreenHeight,
              ),
              CustomButtons(
                buttonText: kLoginText,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              SizedBox(
                height: kSizedBoxWelcomeScreenHeight,
              ),
              CustomButtons(
                buttonText: kSignupText,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
