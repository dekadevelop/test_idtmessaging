import 'package:flutter/foundation.dart';
import 'package:test_idtmessaging/locator.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/repositories/conversation_repo.dart';

class ConversationMessagesViewModel with ChangeNotifier {
  ConversationRepo get repo => getIt.get<ConversationRepo>();

  Future<List<ConversationMessage>> getConversationMessages(String id) async {
    return await repo.fetchConversation(id);
  }
}
