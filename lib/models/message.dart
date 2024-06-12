import 'package:material_chat_app/constant.dart';

class Message {
  final String message;
  final String createAt;
  final String fromId;
  final String email;
  final String name;

  Message(
      {required this.createAt,
      required this.message,
      required this.fromId,
      required this.name,
      required this.email});

  factory Message.fromJson(data) {
    return Message(
        createAt: data[kCreatedAt],
        message: data[kMessage],
        fromId: data['from_id'],
        name: data['name'],
        email: data['email']);
  }
}
