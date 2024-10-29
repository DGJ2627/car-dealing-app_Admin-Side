import 'dart:async';
import 'package:flutter/material.dart';

mixin StreamSubscriptionMixin<State> {
  @protected
  final List<StreamSubscription> _subscriptions = [];

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  void addSubscriptions(List<StreamSubscription> subscriptions) {
    _subscriptions.addAll(subscriptions);
  }

  void cancelAllSubscriptions() {
    if (_subscriptions.isEmpty) return;
    for (final element in _subscriptions) {
      element.cancel();
    }
  }
}

/*
import 'package:speech_to_text/speech_to_text.dart';

// ...

// 1
final SpeechToText_speechToText = SpeechToText();

void _startListening() async {
  bool available = await _speechToText.initialize();
  if (available) {
    _speechToText.listen(onResult: (result) {
      _processSpeech(result.recognizedWords);
    });
  } else {
    // Handle speech recognition initialization error
  }
}

void _processSpeech(String speech) {
  if (speech.toLowerCase().contains('hello flutter')) {
    // Wake word detected
    String query = speech.toLowerCase().replaceAll('hello flutter', '').trim();
    _sendQueryToChatGPT(query);
  }
}



// 2
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

// ...

final _chatGPT = ChatGPT.instance;

void _sendQueryToChatGPT(String query) async {
  final request = CompleteReq(
    prompt: query,
    model: kTranslateModelV3,
    maxTokens: 200,
  );

  final response = await _chatGPT.onCompleteText(request: request);

  // Process the ChatGPT response
  _speakResponse(response!.choices[0].text);
}


// 3

import 'package:flutter_tts/flutter_tts.dart';

// ...

final FlutterTts _flutterTts = FlutterTts();

void _speakResponse(String response) async {
  await _flutterTts.speak(response);
}
 */
