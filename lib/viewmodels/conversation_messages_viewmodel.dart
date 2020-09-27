import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:test_idtmessaging/helpers/datetime_formatter.dart';
import 'package:test_idtmessaging/locator.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/repositories/conversation_repo.dart';

class ConversationMessagesViewModel with ChangeNotifier {
  ConversationRepo get repo => getIt.get<ConversationRepo>();
  Timer timerAnswer;
  Random random;

  List<ConversationMessage> messages;
  ConversationMessagesViewModel()
      : messages = [],
        random = new Random();

  Future<List<ConversationMessage>> getConversationMessages(String id) async {
    messages = await repo.fetchConversation(id);
    messages.sort((a, b) => a.modifiedAt.compareTo(b.modifiedAt));
    return messages;
  }

  sendMessage(String message) {
    messages.add(ConversationMessage(
        id: getNewMessageId(),
        message: message,
        modifiedAt: getCurrentTimeStamp(),
        sender: 'User'));
    notifyListeners();
    startTimerAnswer();
  }

  getRandomAnswer() {
    messages.add(ConversationMessage(
        id: getNewMessageId(),
        message: 'Automatic reply',
        modifiedAt: getCurrentTimeStamp(),
        sender: 'Bot'));
    notifyListeners();
  }

  void startTimerAnswer() {
    var seconds = random.nextInt(4);

    timerAnswer = Timer(
      Duration(seconds: seconds),
      (() => getRandomAnswer()),
    );
  }

  void stopTimerAnswer() {
    if (timerAnswer != null) timerAnswer.cancel();
  }

  String getNewMessageId() {
    try {
      var last = messages.last;
      var id = int.parse(last.id);
      return (id + 1).toString();
    } catch (e) {
      return random.nextInt(1000).toString().padLeft(4, '0');
    }
  }
}
