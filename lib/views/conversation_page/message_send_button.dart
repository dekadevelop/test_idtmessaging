import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';

class MessageSendButton extends StatefulWidget {
  @override
  _MessageSendButtonState createState() => _MessageSendButtonState();
}

class _MessageSendButtonState extends State<MessageSendButton> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel =
        Provider.of<ConversationMessagesViewModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blue.withOpacity(0.1),
      height: 80,
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _controller,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                if (_controller.text != null &&
                    _controller.text.trim().isNotEmpty)
                  viewModel.sendMessage(_controller.text);
              },
              icon: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
