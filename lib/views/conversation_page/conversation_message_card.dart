import 'package:flutter/material.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';

class ConversationMessageCard extends StatelessWidget {
  final ConversationMessage conversationMessage;

  const ConversationMessageCard(this.conversationMessage);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(conversationMessage.id),
          Text(conversationMessage.message),
          Text(conversationMessage.modifiedAt.toString()),
          Text(conversationMessage.sender),
        ],
      ),
    ));
  }
}
