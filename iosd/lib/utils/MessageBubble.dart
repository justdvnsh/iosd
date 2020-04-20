import 'package:flutter/material.dart';
import 'constants.dart';
import 'colors.dart';

class MessageBubble extends StatelessWidget {

  String text;
  String sender;
  bool isMe;

  MessageBubble({@required this.text, this.sender, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
            color: isMe ? AccentColor: Colors.white,
            borderRadius: isMe ? kActiveSenderBorders : kInactiveSenderBorders,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "$text",
                style: isMe ? kTextStyleSender : kTextStyle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
