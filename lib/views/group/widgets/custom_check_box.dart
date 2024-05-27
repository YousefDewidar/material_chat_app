import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.onChanged, required this.label,
  });
  final String label;
  final void Function(bool? p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: true,
      onChanged: onChanged,
      checkboxShape: const CircleBorder(),
      title: Text(label),
    );
  }
}
