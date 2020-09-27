import 'package:test_idtmessaging/locator.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:test_idtmessaging/repositories/conversation_repo.dart';

class ConversationViewModel {
  ConversationRepo get repo => getIt.get<ConversationRepo>();

  Future<List<Conversation>> getConversations() async {
    return await repo.fetchConversations();
  }
}
