import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/viewmodels/conversation_viewmodel.dart';
import 'package:test_idtmessaging/views/conversation_page/conversation_message_send.dart';

import 'conversation_message_card.dart';

class ConversationPage extends StatelessWidget {
  final Conversation conversation;

  const ConversationPage(this.conversation);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ConversationViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(conversation.topic)),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: FutureBuilder<List<ConversationMessage>>(
              future: viewModel.getConversation(conversation.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var messages = snapshot.data;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ConversationMessageCard(messages[index]);
                    },
                  );
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
