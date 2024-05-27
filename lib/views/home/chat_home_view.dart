import 'package:flutter/material.dart';
import 'package:material_chat_app/views/chat/widgets/add_friend_button_sheet.dart';
import 'package:material_chat_app/views/chat/widgets/chat_card.dart';

class ChatHomeView extends StatefulWidget {
  const ChatHomeView({super.key});

  @override
  State<ChatHomeView> createState() => _ChatHomeViewState();
}

class _ChatHomeViewState extends State<ChatHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) => const AddFriendBottomSheet(),
          );
        },
        child: const Icon(Icons.chat),
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          'Chats',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const ChatCard();
          },
        ),
      ),
    );
  }
}
