import 'package:flutter/material.dart';
import 'package:voiceapp/pages/mail.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'dart:async';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Mail(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late TextEditingController emailcontroller;
//   var emailValue = "";
//   var nextPage = false;
//   late SpeechToText speechToText = SpeechToText();

//   void askEmail() async {
//     var userEmail = '';
//     await speechToText.listen(onResult: (result) {
//       userEmail = result.recognizedWords;
//       tts.speak("is email $userEmail correct");
//       Future.delayed(const Duration(seconds: 5), () {
//         confirmEmail(userEmail);
//       });
//     });
//   }

//   void confirmEmail(userEmail) async {
//     await speechToText.listen(onResult: (result) {
//       var answer = result.recognizedWords;
//       if (answer.contains("yes")) {
//         tts.stop();
//         setState(() {
//           emailValue = userEmail;
//           nextPage = true;
//         });
//       } else {
//         tts.speak("Say Email again");
//         Future.delayed(const Duration(seconds: 6), () {
//           askEmail();
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     emailcontroller = TextEditingController();
//     speechToText.initialize();
//     tts.speak("Welcome To the Login Page Please Say Your Email");
//     Future.delayed(const Duration(seconds: 3), () {
//       askEmail();
//     });
//   }

//   @override
//   void dispose() {
//     emailcontroller.dispose();
//     tts.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     if (true) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Mail()),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text("Email"),
//               Text(emailValue),
//             ],
//           )),
//           GestureDetector(
//             onTap: () {
//               // contuinue
//             },
//             child: SizedBox(
//               width: width,
//               height: height,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               // Go back
//             },
//             child: SizedBox(
//               width: width / 2,
//               height: height,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
