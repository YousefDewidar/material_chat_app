import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';

class DeleteMessagesDialog extends StatelessWidget {
  const DeleteMessagesDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Delete All Messages?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection(kMessagesCollection)
                          .get()
                          .then((value) {
                        for (var doc in value.docs) {
                          doc.reference.delete();
                        }
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('YES')),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('NO')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
