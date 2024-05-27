import 'package:flutter/material.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class AddFriendBottomSheet extends StatelessWidget {
  const AddFriendBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Enter friend email',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton.filled(
                  onPressed: () {}, icon: const Icon(Icons.qr_code_scanner))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomTextField(
            label: 'Email',
            icon: Icons.email,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(text: 'Create chat', onPressed: () {},color: Theme.of(context).colorScheme.inversePrimary,)
        ],
      ),
    );
  }
}
