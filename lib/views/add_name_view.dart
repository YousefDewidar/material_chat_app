
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';


import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class AddNameView extends StatefulWidget {
  const AddNameView({super.key});

  @override
  State<AddNameView> createState() => _AddNameViewState();
}

class _AddNameViewState extends State<AddNameView> {
  final TextEditingController nameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              // Reset text
              const Text(
                'Add Name,',
                style: TextStyle(fontSize: 36),
              ),

              const SizedBox(
                height: 18,
              ),

              const Text(
                'Please enter your name',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),

              CustomTextField(
                label: 'Name',
                icon: Icons.person,
                controller: nameCon,
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(
                text: 'Create account',
                onPressed: ()  {
                
                },
                color: kPrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
