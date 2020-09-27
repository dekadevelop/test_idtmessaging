import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';
import 'package:test_idtmessaging/views/conversation_page/conversation_message_send.dart';

import 'conversation_message_card.dart';
import 'messages_list.dart';

class ConversationPage extends StatelessWidget {
  final Conversation conversation;

  const ConversationPage(this.conversation);

  @override
  Widget build(BuildContext context) {
    var viewModel =
        Provider.of<ConversationMessagesViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(conversation.topic)),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: FutureBuilder<List<ConversationMessage>>(
              future: viewModel.getConversationMessages(conversation.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var messages = snapshot.data;
                  return MessagesList();
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConversationMessageSend(),
          )
        ],
      ),
    );
  }
}
