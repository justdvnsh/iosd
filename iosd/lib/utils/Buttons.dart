import 'package:flutter/material.dart';
import 'constants.dart';
import 'colors.dart';

class CustomButtons extends StatelessWidget {

  GestureTapCallback onPressed;
  String buttonText;

  CustomButtons({@required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: AccentColor,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Padding(
        padding: kPaddingWelcomeScreen,
        child: Text(
          buttonText,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
