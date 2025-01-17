import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/models/conversation.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';
import 'package:test_idtmessaging/views/styles/ui_styles.dart';
import 'package:test_idtmessaging/views/widgets/appbar_background.dart';
import 'message_send_section.dart';
import 'messages_list.dart';

class ConversationPage extends StatelessWidget {
  final Conversation conversation;

  const ConversationPage(this.conversation);

  @override
  Widget build(BuildContext context) {
    var viewModel =
        Provider.of<ConversationMessagesViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(conversation.topic),
        flexibleSpace: AppBarBackGround(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kSendMessageContainerH),
              child: FutureBuilder<List<ConversationMessage>>(
                future: viewModel.getConversationMessages(conversation.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var messages = snapshot.data;
                    return MessagesList();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageSendSection(),
            )
          ],
        ),
      ),
    );
  }
}
