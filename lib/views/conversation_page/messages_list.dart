import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';

import 'message_card.dart';

class MessagesList extends StatefulWidget {
  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ConversationMessagesViewModel>(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      controller: _scrollController,
      itemCount: viewModel.messages.length,
      itemBuilder: (BuildContext context, int index) {
        return MessageCard(viewModel.messages[index]);
      },
    );
  }
}
