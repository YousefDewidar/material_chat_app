import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';

class SendMessageWidget extends StatefulWidget {
  final Function scrollDown;
  final String email;
  const SendMessageWidget({
    super.key,
    required this.scrollDown,
    required this.email
  });

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // text input & camera & emoji
          Expanded(
            child: Card(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // button send
          IconButton.filled(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  messages.add(
                      {kMessage: controller.text, kCreatedAt: DateTime.now(),'email':widget.email});
                  widget.scrollDown();
                  controller.clear();
                  setState(() {});
                }
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
