import 'package:flutter/material.dart';
import 'package:test_idtmessaging/helpers/datetime_formatter.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';

class MessageCard extends StatelessWidget {
  final ConversationMessage conversationMessage;

  const MessageCard(this.conversationMessage);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(conversationMessage.id ?? ''),
          Text(conversationMessage.message ?? ''),
          Text(getDateFromTimeStamp(conversationMessage.modifiedAt ?? 0)),
          Text(conversationMessage.sender ?? ''),
        ],
      ),
    ));
  }
}
