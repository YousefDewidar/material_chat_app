import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty && widget.label == 'Email') {
          return 'Please enter your email';
        } else if (value.isEmpty && widget.label == 'Password') {
          return 'Please enter your password';
        } else {
          return null;
        }
      },
      obscureText: widget.label != "Password" ? false : !isVisable,
      decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.label != "Password"
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
