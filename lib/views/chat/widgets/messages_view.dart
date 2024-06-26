import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/models/message.dart';
import 'package:material_chat_app/views/chat/widgets/message_card.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(kMessagesCollection)
            .orderBy(kCreatedAt, descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> messagesList = [];
            List<String> idList = [];
            List<String> nameList = [];
            List<String> emailList = [];
            List<DateTime> timeList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(snapshot.data!.docs[i][kMessage]);
              timeList.add(snapshot.data!.docs[i][kCreatedAt].toDate());
              idList.add(snapshot.data!.docs[i]['from_id']);
              nameList.add(snapshot.data!.docs[i]['name']);
              emailList.add(snapshot.data!.docs[i]['email']);
            }
            return Expanded(
              child: ListView.builder(
                reverse: true,
                controller: controller,
                itemCount: messagesList.length,
                itemBuilder: (context, index) {
                  return MessageCard(
                    message: Message(
                      name: nameList[index],
                        email: emailList[index],
                        fromId: idList[index],
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
        });
  }
}
