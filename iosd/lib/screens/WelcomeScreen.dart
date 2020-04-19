import 'package:flutter/material.dart';
import 'package:iosd/utils/constants.dart';
import 'package:iosd/utils/Buttons.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  "IOSD",
                  style: kTextStyleWelcomeScreen,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtons(
                buttonText: "Login",
                onPressed: () {},
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtons(
                buttonText: "Signup",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
