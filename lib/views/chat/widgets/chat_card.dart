import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/chat/in_chat_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return InChatView();
          },
        ));
      },
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(kMessagesCollection)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(),
                  title: const Text('Name'),
                  subtitle: const Text('Last message'),
                  trailing: Badge(
                    label: Text('${snapshot.data!.docs.length}'),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    largeSize: 30,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
