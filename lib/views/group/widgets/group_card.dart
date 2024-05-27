import 'package:flutter/material.dart';
import 'package:material_chat_app/views/group/in_group_view.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InGroupView(),
            ));
      },
      child: const Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('G'),
          ),
          title: Text('Group Name'),
          subtitle: Text('Last message'),
          trailing: Badge(
            label: Text('2'),
            padding: EdgeInsets.symmetric(horizontal: 10),
            largeSize: 30,
          ),
        ),
      ),
    );
  }
}
