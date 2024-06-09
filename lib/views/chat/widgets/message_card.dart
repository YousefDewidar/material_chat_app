import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key,
      required this.index,
      required this.isGroup,
      required this.message});
  final int index;
  final bool isGroup;
  final String message;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                index % 2 == 0
                    ? const SizedBox(
                        height: 0,
                      )
                    : const Text("Name"),
                Text(message),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('12:00 am'),
                    const SizedBox(
                      width: 4,
                    ),
                    index % 2 == 0
                        ? const Icon(
                            Icons.done_all,
                            size: 15,
                          )
                        : const SizedBox(
                            width: 0,
                          )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
