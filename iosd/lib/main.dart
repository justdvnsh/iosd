import 'package:flutter/material.dart';
import 'package:iosd/screens/ChatScreen.dart';
import 'package:iosd/screens/LoginScreen.dart';
import 'package:iosd/screens/SignupScreen.dart';
import 'screens/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      }
    );
  }
}
