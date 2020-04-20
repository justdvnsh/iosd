import 'package:flutter/material.dart';
import 'constants.dart';
import 'colors.dart';

class MessageBubble extends StatelessWidget {

  String text;
  String sender;

  MessageBubble({@required this.text, this.sender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "$sender",
            style: kSenderStyle
          ),
          SizedBox(
            height: 4.0,
          ),
          Material(
            elevation: 8.0,
            color: AccentColor,
            borderRadius: BorderRadius.circular(50.0),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "$text",
                style: kTextStyle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
