import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/SpeachManager.dart';

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    late TextEditingController emailcontroller;
    late TextEditingController subjectcontroller;
    late TextEditingController bodycontroller;

    @override
    void initState() {
      super.initState();
      emailcontroller = TextEditingController();
      subjectcontroller = TextEditingController();
      bodycontroller = TextEditingController();
    }

    @override
    void dispose() {
      emailcontroller.dispose();
      subjectcontroller.dispose();
      bodycontroller.dispose();
      super.dispose();
    }

    return Stack(
      children: [
        Positioned.fill(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Email"),
            TextField(
              controller: emailcontroller,
            ),
            const Text("Subject"),
            TextField(
              controller: subjectcontroller,
            ),
            const Text("Body"),
            TextField(
              controller: bodycontroller,
            ),
          ],
        )),
        GestureDetector(
          onTap: () {
            // contuinue
          },
          child: SizedBox(
            width: width,
            height: height,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Go back
          },
          child: SizedBox(
            width: width / 2,
            height: height,
          ),
        )
      ],
    );
  }
}
