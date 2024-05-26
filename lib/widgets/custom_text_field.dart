import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.label == "Email" ? false : !isVisable,
      decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.label == "Email"
              ? null
              : IconButton(
                  onPressed: () {
                    isVisable = !isVisable;
                    setState(() {});
                  },
                  icon: isVisable
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
          contentPadding: const EdgeInsets.all(17),
          labelText: widget.label,
          floatingLabelStyle: TextStyle(fontSize: 18, color: kPrimaryColor),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kPrimaryColor)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}