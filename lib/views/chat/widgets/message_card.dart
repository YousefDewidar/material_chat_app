import 'package:flutter/material.dart';
import 'package:material_chat_app/firebase/auth.dart';
import 'package:material_chat_app/models/message.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key,
      required this.index,
      required this.isGroup,
      required this.message});
  final int index;
  final bool isGroup;
  final Message message;

  bool isMyAcc() {
    if (message.fromId == Auth.user.uid) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMyAcc() ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Card(
          color: isMyAcc()
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.tertiaryContainer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(!isMyAcc() ? 0 : 12),
            bottomRight: Radius.circular(isMyAcc() ? 0 : 12),
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
                Text(message.message),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(message.createAt),
                    const SizedBox(
                      width: 4,
                    ),
                    isMyAcc()
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
