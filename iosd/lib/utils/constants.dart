import 'package:flutter/material.dart';

// size constants
double kSizedBoxWelcomeScreenHeight = 20.0;
var kPaddingWelcomeScreen = const EdgeInsets.all(20.0);

// string constants
String kWelcomeText = "I.O.S.D";
String kSignupText = "Signup";
String kLoginText = "Login";
String kEmailHintText = "Enter Your email";
String kPasswordHintText = "Enter Your Password";
String kNotAMember = "Not Registered ? Register Here";
String kAlreadyAMember = "Already a Member ? Login Here";

// style constants
const kTextStyleWelcomeScreen = TextStyle(
  fontSize: 34.0,
  fontWeight: FontWeight.w900,
  color: Colors.white
);

const kButtonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kBottomHintTextStyle = TextStyle(
  fontSize: 14.0,
);

const kTextStyleSender = TextStyle(
    fontSize: 16.0,
);

const kTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black54
);

const kSenderStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.white
);

// borders
const kActiveSenderBorders = BorderRadius.only(
  topLeft: Radius.circular(50.0),
  bottomLeft: Radius.circular(50.0),
  bottomRight: Radius.circular(50.0)
);

const kInactiveSenderBorders = BorderRadius.only(
    bottomLeft: Radius.circular(50.0),
    bottomRight: Radius.circular(50.0),
    topRight:Radius.circular(50.0)
);