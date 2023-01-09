import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:text_to_speech/text_to_speech.dart';

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  var textEmail = "";
  var textSubject = "";
  var textBody = "";

  late TextToSpeech tts = TextToSpeech();
  late SpeechToText speechToText = SpeechToText();

  void askBody() async {
    tts.speak("What Is Body of email");
    await Future.delayed(const Duration(seconds: 5), () async {
      await speechToText.listen(onResult: (result) {
        setState(() {
          textBody = result.recognizedWords;
        });

        Future.delayed(const Duration(seconds: 5), () async {
          // Send mail
        });
      });
    });
  }

  void askSubject() async {
    tts.speak("What Is Subject of  email");
    await Future.delayed(const Duration(seconds: 5), () async {
      await speechToText.listen(onResult: (result) {
        setState(() {
          textSubject = result.recognizedWords;
        });

        Future.delayed(const Duration(seconds: 5), () async {
          askBody();
        });
      });
    });
  }

  void askEmail() async {
    tts.speak("What Is recipient email");
    await Future.delayed(const Duration(seconds: 5), () async {
      await speechToText.listen(onResult: (result) {
        setState(() {
          textEmail = result.recognizedWords;
        });

        Future.delayed(const Duration(seconds: 5), () async {
          askSubject();
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    speechToText.initialize();
    tts.stop();
    askEmail();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Email"),
            Text(textEmail),
            const Text("Subject"),
            Text(textSubject),
            const Text("Body"),
            Text(textBody),
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
    ));
  }
}
