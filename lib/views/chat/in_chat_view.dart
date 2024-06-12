import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/firebase/auth.dart';
import 'package:material_chat_app/firebase/data_base.dart';
import 'package:material_chat_app/views/chat/widgets/delete_messages_dialog.dart';
import 'package:material_chat_app/views/chat/widgets/messages_view.dart';
import 'package:material_chat_app/views/chat/widgets/send_message.dart';

class InChatView extends StatelessWidget {
  InChatView({
    super.key,
  });
  final ScrollController controller = ScrollController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
              StreamBuilder(
                  stream: DataBase().message.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                      String name = snapshot.data!.docs.last['name'];
                      return Text(name);
                    } else {
                      return Text('Name');
                    }
                  }),
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
            MessagesView(controller: controller),

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
