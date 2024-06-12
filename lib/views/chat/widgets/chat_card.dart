import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/chat/in_chat_view.dart';
import 'package:material_chat_app/views/chat/widgets/say_hi_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(kMessagesCollection)
            .orderBy(kCreatedAt)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return InChatView();
                  },
                ));
              },
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(),
                  title: const Text('Name'),
                  subtitle: Text(snapshot.data!.docs.isEmpty
                      ? 'Last message'
                      : snapshot.data!.docs.last[kMessage]),
                  trailing: Badge(
                    label: Text('${snapshot.data!.docs.length}'),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    largeSize: 30,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
