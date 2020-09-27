import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';
import 'package:test_idtmessaging/views/conversation_page/conversation_page.dart';

class ConversationCard extends StatelessWidget {
  final Conversation conversation;

  const ConversationCard(this.conversation);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListenableProvider(
              create: (_) => ConversationMessagesViewModel(),
              child: ConversationPage(conversation),
            ),
          ),
        );
      },
      child: Card(
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
      ),
    );
  }
}
