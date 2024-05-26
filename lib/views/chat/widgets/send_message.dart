
import 'package:flutter/material.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
  });

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
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
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
              onPressed: () {}, icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
