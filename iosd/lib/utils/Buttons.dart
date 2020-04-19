import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButtons extends StatelessWidget {

  GestureTapCallback onPressed;
  String buttonText;

  CustomButtons({@required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          buttonText
        ),
      ),
    );
  }
}
