import 'package:flutter/material.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class AddFriendBottomSheet extends StatefulWidget {
  const AddFriendBottomSheet({super.key});

  @override
  State<AddFriendBottomSheet> createState() => _AddFriendBottomSheetState();
}

class _AddFriendBottomSheetState extends State<AddFriendBottomSheet> {
  final TextEditingController emailCon = TextEditingController();
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
          CustomTextField(
            label: 'Email',
            icon: Icons.email,
            controller: emailCon,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Create chat',
            onPressed: () {},
            color: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
      ),
    );
  }
}
