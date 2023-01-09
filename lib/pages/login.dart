import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/SpeachManager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailcontroller;
  late TextEditingController titlecontroller;

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Text to speech comes first
    // Choose language
    // Page name, Required fields, results
    // Change Page, Confirm, Cancel, Change Language
    var speach = SpeachManager();
    speach.initSpeech();
    speach.startListening();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Email:"),
        TextField(
          controller: emailcontroller,
        ),
      ],
    );
  }
}
