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
          color:
              conversationMessage.sent ? Colors.green[50] : Colors.blueGrey[50],
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
                  right: 0,
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
