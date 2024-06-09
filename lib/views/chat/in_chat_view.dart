import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/models/message.dart';
import 'package:material_chat_app/views/chat/widgets/delete_messages_dialog.dart';
import 'package:material_chat_app/views/chat/widgets/message_card.dart';
import 'package:material_chat_app/views/chat/widgets/send_message.dart';

class InChatView extends StatelessWidget {
  InChatView({super.key});
  final ScrollController controller = ScrollController();

  void scrollDown() {
    controller.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  void deleteAllMessages(context) {
    showDialog(
      context: context,
      builder: (context) => const DeleteMessagesDialog(),
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
              const Text("yousef"),
              Text(
                "last seen 11:45 am",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                deleteAllMessages(context);
              },
              icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            // messages
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(kMessagesCollection)
                    .orderBy(kCreatedAt,descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<String> messagesList = [];
                    List<DateTime> timeList = [];
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      messagesList.add(snapshot.data!.docs[i][kMessage]);
                      timeList.add(snapshot.data!.docs[i][kCreatedAt].toDate());
                    }
                    return Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return MessageCard(
                            message: Message(
                                message: messagesList[index],
                                createAt:
                                    '${timeList[index].hour}:${timeList[index].minute} am'),
                            index: index,
                            isGroup: false,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Expanded(child: SizedBox());
                  }
                }),

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
