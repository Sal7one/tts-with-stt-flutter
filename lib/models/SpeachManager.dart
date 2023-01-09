import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeachManager {
  
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
  }

  /// This has to happen only once per app
  void initSpeech() async {
    if (!speechEnabled) speechEnabled = await speechToText.initialize();
  }

  void stopListening() async {
    await speechToText.stop();
  }
}
