import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';

import 'conversation_message_card.dart';

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ConversationMessagesViewModel>(context);
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: viewModel.messages.length,
      itemBuilder: (BuildContext context, int index) {
        return ConversationMessageCard(viewModel.messages[index]);
      },
    );
    ;
  }
}
