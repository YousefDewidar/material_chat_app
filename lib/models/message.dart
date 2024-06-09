class Message {
  final String message;
  final String createAt;

  Message({required this.createAt, required this.message});

  factory Message.fromJson(data) {
    return Message.fromJson(data['message']);
  }
}
