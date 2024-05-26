import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.black),
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(17))),
      onPressed: () {},
      child: Center(
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
