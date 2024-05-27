import 'package:flutter/material.dart';
import 'package:material_chat_app/views/group/widgets/group_card.dart';

class GroupHomeView extends StatefulWidget {
  const GroupHomeView({super.key});

  @override
  State<GroupHomeView> createState() => _GroupHomeViewState();
}

class _GroupHomeViewState extends State<GroupHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.group),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Groups',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const GroupCard();
          },
        ),
      ),
    );
  }
}
