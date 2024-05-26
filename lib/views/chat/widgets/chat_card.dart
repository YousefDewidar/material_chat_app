
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
