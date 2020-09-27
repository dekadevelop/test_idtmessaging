import 'package:flutter/foundation.dart';

class ConversationMessage {
  final String id;
  final String message;
  final int modifiedAt;
  final String sender;
  final bool sent;

  ConversationMessage({
    @required this.id,
    this.message,
    this.modifiedAt,
    this.sender,
    this.sent = false,
  });

  factory ConversationMessage.fromJson(Map<String, dynamic> json) {
    return ConversationMessage(
      id: json['id'],
      message: json['message'],
      modifiedAt: json['modified_at'],
      sender: json['sender'],
    );
  }
}
