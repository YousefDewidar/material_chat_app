import 'package:material_chat_app/constant.dart';

class Message {
  final String message;
  final String createAt;
  final String id;

  Message({required this.createAt, required this.message, required this.id});

  factory Message.fromJson(data) {
    return Message(
        createAt: data[kCreatedAt], message: data[kMessage], id: data['id']);
  }
}
