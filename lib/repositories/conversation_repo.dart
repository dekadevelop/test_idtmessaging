import 'dart:convert';
import 'package:test_idtmessaging/helpers/json_formatter.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:http/http.dart' as http;
import 'package:test_idtmessaging/models/conversation_message.dart';

class ConversationRepo {
  Future<List<Conversation>> fetchConversations() async {
    final response = await http.get(
        'https://idtm-media.s3.amazonaws.com/programming-test/api/inbox.json');

    if (response.statusCode == 200) {
      var data = clearTrailingComma(response.body);
      Iterable list = jsonDecode(data);
      return List<Conversation>.from(list.map((i) => Conversation.fromJson(i)));
    } else {
      throw Exception('Failed to load conversations');
    }
  }

  Future<List<ConversationMessage>> fetchConversation(String id) async {
    final response = await http.get(
        'https://idtm-media.s3.amazonaws.com/programming-test/api/$id.json');

    if (response.statusCode == 200) {
      var data = clearTrailingComma(response.body);
      Iterable list = jsonDecode(data);
      return List<ConversationMessage>.from(
          list.map((i) => ConversationMessage.fromJson(i)));
    } else {
      throw Exception('Failed to load the conversation $id');
    }
  }
}
