import 'package:flutter/material.dart';
import 'colors.dart';
import 'constants.dart';

class InputBox extends StatelessWidget {

  String hintText;
  Function onChange;
  TextInputType keyboardType;
  bool obscureText;
  TextEditingController controller;

  InputBox({this.hintText, this.onChange, this.keyboardType, this.obscureText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
          color: Colors.white
      ),
      onChanged: onChange,
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
