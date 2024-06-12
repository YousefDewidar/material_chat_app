import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/chat/in_chat_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  handleLastmessage(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.data!.docs.isEmpty) {
      return 'Last message';
    } else {
      if (snapshot.data!.docs.last[kMessage].toString().contains('https://')) {
        return 'Photo';
      } else {
        return snapshot.data!.docs.last[kMessage];
      }
    }
  }

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
                  subtitle: Text(handleLastmessage(snapshot)),
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
