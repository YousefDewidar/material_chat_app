import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Card(
          color: index % 2 != 0
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(index % 2 != 0 ? 0 : 12),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 12),
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
          )),
          child: Container(
            padding: const EdgeInsets.all(12),
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("messagesggggg"), Text('12:00 am')],
            ),
          ),
        ),
      ],
    );
  }
}
