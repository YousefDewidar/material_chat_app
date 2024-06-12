import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_chat_app/firebase/data_base.dart';
import 'package:material_chat_app/firebase/storage.dart';

class SendMessageWidget extends StatefulWidget {
  final Function scrollDown;
  const SendMessageWidget({
    super.key,
    required this.scrollDown,
  });
  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
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
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);

                          if (image != null) {
                            String imgUrl = await FireStorage()
                                .sendImage(file: File(image.path));
                            DataBase().sendMessage(msg: imgUrl);
                          }
                        },
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
                  DataBase().sendMessage(msg: controller.text);
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
