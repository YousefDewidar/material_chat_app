import 'package:flutter/material.dart';
import 'package:material_chat_app/views/group/widgets/custom_check_box.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  final TextEditingController nameCon = TextEditingController();
  void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Group',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo_outlined)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child:
                        CustomTextField(label: 'Group Name', icon: Icons.group,controller: nameCon,))
              ],
            ),
            const Divider(
              height: 50,
              indent: 50,
              endIndent: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Members',
                  style: TextStyle(fontSize: 16),
                ),
                Text('0', style: TextStyle(fontSize: 16)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CustomCheckbox(onChanged: onChanged, label: 'Yousef'),
                  CustomCheckbox(onChanged: onChanged, label: 'Nada'),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Done'),
        icon: const Icon(Icons.done),
      ),
    );
  }
}
