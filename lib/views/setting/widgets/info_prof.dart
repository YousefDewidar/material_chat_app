import 'package:flutter/material.dart';
import 'package:material_chat_app/firebase/auth.dart';
import 'package:material_chat_app/views/setting/qr_code_view.dart';

class InfoProf extends StatelessWidget {
  const InfoProf({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            Auth.user.displayName ?? '',
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QrCodeView(),
                    ));
              })
        ],
      ),
    );
  }
}
