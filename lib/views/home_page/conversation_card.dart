import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/helpers/datetime_formatter.dart';
import 'package:test_idtmessaging/helpers/random_helper.dart';
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
        _goToConversation(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Stack(
            children: [
              Row(
                children: [
                  _avatar(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _mainContent(),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: _modifiedAt(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _goToConversation(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListenableProvider(
          create: (_) => ConversationMessagesViewModel(),
          child: ConversationPage(conversation),
        ),
      ),
    );
  }

  Container _modifiedAt() {
    return Container(
      width: 90,
      child: Text(
        getDateFromTimeStamp(conversation.modifiedAt),
        textAlign: TextAlign.end,
        maxLines: 2,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 12,
        ),
      ),
    );
  }

  Container _avatar() {
    return Container(
      width: 60,
      child: CircleAvatar(
        radius: 30,
        backgroundImage:
            AssetImage('assets/avatars/avatar${getRandomInt(4)}.png'),
      ),
    );
  }

  Column _mainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          conversation.topic,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(conversation.lastMessage),
        SizedBox(height: 5),
        Text(conversation.members.toString()),
      ],
    );
  }
}
