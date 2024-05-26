import 'package:flutter/material.dart';

class InfoProf extends StatelessWidget {
  const InfoProf({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Yousef',
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
          Icon(Icons.qr_code_scanner),
        ],
      ),
    );
  }
}
