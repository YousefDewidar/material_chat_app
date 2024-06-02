import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: const MaterialStatePropertyAll(Colors.black),
            backgroundColor: MaterialStatePropertyAll(color),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(17))),
        onPressed: onPressed,
        child: Center(
          child: Text(text.toUpperCase()),
        ));
  }
}
