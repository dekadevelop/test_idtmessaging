import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:test_idtmessaging/locator.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/repositories/conversation_repo.dart';

class ConversationMessagesViewModel with ChangeNotifier {
  ConversationRepo get repo => getIt.get<ConversationRepo>();
  Timer timerAnswer;

  List<ConversationMessage> messages;
  ConversationMessagesViewModel() : messages = [];

  Future<List<ConversationMessage>> getConversationMessages(String id) async {
    messages = await repo.fetchConversation(id);
    return messages;
  }

  sendMessage(String message) {
    messages.add(ConversationMessage(id: '123', message: message));
    notifyListeners();
    startTimerAnswer();
  }

  getRandomAnswer() {
    messages.add(ConversationMessage(id: '123', message: 'randomMessage'));
    notifyListeners();
  }

  void startTimerAnswer() {
    timerAnswer = Timer(
      Duration(seconds: 2),
      (() => getRandomAnswer()),
    );
  }

  void stopTimerAnswer() {
    if (timerAnswer != null) timerAnswer.cancel();
  }
}
