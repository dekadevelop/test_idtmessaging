import 'package:flutter/foundation.dart';

class Conversation {
  final String id;
  final String lastMessage;
  final List<String> members;
  final String topic;
  final int modifiedAt;

  Conversation({
    @required this.id,
    this.lastMessage,
    this.members,
    this.topic,
    this.modifiedAt,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'],
      lastMessage: json['last_message'],
      members: List.from(json['members']),
      topic: json['topic'],
      modifiedAt: json['modified_at'],
    );
  }
}
