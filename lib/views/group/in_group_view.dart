import 'package:flutter/material.dart';
import 'package:material_chat_app/views/chat/widgets/message_card.dart';
import 'package:material_chat_app/views/chat/widgets/send_message.dart';

class InGroupView extends StatelessWidget {
  const InGroupView({super.key});

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
                    message: 'i love u',
                    index: index,
                    isGroup: true,
                  );
                },
              ),
            ),

            // message text input
            const SendMessageWidget(),
          ],
        ),
      ),
    );
  }
}
