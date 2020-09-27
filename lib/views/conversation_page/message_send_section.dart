import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/viewmodels/conversation_messages_viewmodel.dart';
import 'package:test_idtmessaging/views/styles/ui_styles.dart';

class MessageSendSection extends StatefulWidget {
  @override
  _MessageSendSectionState createState() => _MessageSendSectionState();
}

class _MessageSendSectionState extends State<MessageSendSection> {
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: kSendMessageContainerH,
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _textFormMessage(),
            ),
          ),
          Expanded(
            flex: 2,
            child: _messageSendButton(viewModel),
          ),
        ],
      ),
    );
  }

  CircleAvatar _messageSendButton(ConversationMessagesViewModel viewModel) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue,
      child: IconButton(
        color: Colors.white,
        onPressed: () {
          if (_controller.text != null && _controller.text.trim().isNotEmpty)
            viewModel.sendMessage(_controller.text);
          FocusScope.of(context).unfocus();
        },
        icon: Icon(Icons.send),
      ),
    );
  }

  TextFormField _textFormMessage() {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[500]),
          hintText: "Type in your text",
          fillColor: Colors.grey.withOpacity(0.1)),
    );
  }
}
