import 'package:flutter/material.dart';
import 'package:test_idtmessaging/helpers/datetime_formatter.dart';
import 'package:test_idtmessaging/models/conversation_message.dart';
import 'package:test_idtmessaging/views/styles/text_styles.dart';

class MessageCard extends StatelessWidget {
  final ConversationMessage conversationMessage;

  const MessageCard(this.conversationMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: conversationMessage.sent
          ? EdgeInsets.only(left: 30)
          : EdgeInsets.only(right: 30),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft:
                  conversationMessage.sent ? Radius.circular(20) : Radius.zero,
              topRight:
                  conversationMessage.sent ? Radius.zero : Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          color:
              conversationMessage.sent ? Colors.blue[50] : Colors.blueGrey[50],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conversationMessage.sender ?? '',
                      style: kCardTitleStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(conversationMessage.message ?? ''),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: Text(
                    getDateFromTimeStamp(conversationMessage.modifiedAt ?? 0),
                    style: kCardDateStyle,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
