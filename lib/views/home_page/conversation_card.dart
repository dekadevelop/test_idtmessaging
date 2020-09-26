import 'package:flutter/material.dart';
import 'package:test_idtmessaging/models/conversation.dart';

class ConversationCard extends StatelessWidget {
  final Conversation conversation;

  const ConversationCard(this.conversation);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(conversation.id),
            Text(conversation.topic),
            Text(conversation.lastMessage),
            Text(conversation.members.toString()),
            Text(conversation.modifiedAt.toString()),
          ],
        ),
      ),
    );
  }
}
