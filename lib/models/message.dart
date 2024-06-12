import 'package:material_chat_app/constant.dart';

class Message {
  final String message;
  final String createAt;

  Message({required this.createAt, required this.message});

  factory Message.fromJson(data) {
    return Message(createAt: data[kCreatedAt], message: data[kMessage]);
  }
}
