import 'package:flutter/material.dart';
import 'package:test_idtmessaging/models/conversation.dart';

class ConversationPage extends StatelessWidget {
  final Conversation conversation;

  const ConversationPage(this.conversation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(conversation.topic)),
      body: Center(
        child: Text(conversation.id),
      ),
    );
  }
}
