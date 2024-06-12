import 'package:flutter/material.dart';
import 'package:material_chat_app/models/message.dart';
import 'package:material_chat_app/views/chat/widgets/message_card.dart';
import 'package:material_chat_app/views/chat/widgets/send_message.dart';

class InGroupView extends StatelessWidget {
  InGroupView({super.key});
  final ScrollController controller = ScrollController();
  void scrollDown() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name Group"),
              Text(
                "Ahmed, yousef, Ali...",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            // messages
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return MessageCard(
                    message: Message(
                      fromId: 'as',
                      name: '',
                      message: 'i love u',
                      createAt: ' am',
                      email: ''
                    ),
                    index: index,
                    isGroup: true,
                  );
                },
              ),
            ),

            // message text input
            SendMessageWidget(
              scrollDown: scrollDown,
            ),
          ],
        ),
      ),
    );
  }
}
