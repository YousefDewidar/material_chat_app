import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_chat_app/views/chat/widgets/message_card.dart';
import 'package:material_chat_app/views/chat/widgets/send_message.dart';

class InChatView extends StatefulWidget {
  const InChatView({super.key});

  @override
  State<InChatView> createState() => _InChatViewState();
}

class _InChatViewState extends State<InChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("yousef"),
              Text(
                "last seen 11:45 am",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
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
                itemCount: 6,
                itemBuilder: (context, index) {
                  return MessageCard(
                    index: index,
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
