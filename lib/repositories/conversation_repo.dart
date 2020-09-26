import 'dart:convert';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:http/http.dart' as http;

class ConversationRepo {
  Future<List<Conversation>> fetchConversations() async {
    final response = await http.get(
        'https://idtm-media.s3.amazonaws.com/programming-test/api/inbox.json');

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return List<Conversation>.from(list.map((i) => Conversation.fromJson(i)));
    } else {
      throw Exception('Failed to load conversations');
    }
  }
}
