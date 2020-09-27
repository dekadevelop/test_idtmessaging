import 'package:flutter/material.dart';

class ConversationMessageSend extends StatefulWidget {
  @override
  _ConversationMessageSendState createState() =>
      _ConversationMessageSendState();
}

class _ConversationMessageSendState extends State<ConversationMessageSend> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
