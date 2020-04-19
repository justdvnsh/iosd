import 'package:flutter/material.dart';
import 'colors.dart';
import 'constants.dart';

class InputBox extends StatelessWidget {

  String hintText;

  InputBox({@required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(25.0),
        filled: false,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: AccentColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}
