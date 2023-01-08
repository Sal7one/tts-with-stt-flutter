import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("Email:"),
        TextField(),
        Text("Password:"),
        TextField(),
      ],
    );
  }
}