import 'package:test_idtmessaging/locator.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:test_idtmessaging/repositories/conversation_repo.dart';

class ConversationViewModel {
  Future<List<Conversation>> getConversations() async {
    return await getIt.get<ConversationRepo>().fetchConversations();
  }
}
