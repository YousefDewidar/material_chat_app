import 'package:flutter/material.dart';

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
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Chats',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('Name'),
                subtitle: Text('Last message'),
                trailing: Badge(
                  label: Text('5'),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  largeSize: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
