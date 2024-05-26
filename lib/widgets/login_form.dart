import 'package:flutter/material.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        
        child: Column(
          children: [
            const CustomTextField(
              label: 'Email',
              icon: Icons.email_outlined,
            ),

            const SizedBox(
              height: 15,
            ),

            const CustomTextField(
              label: 'Password',
              icon: Icons.password,
            ),

            const SizedBox(
              height: 15,
            ),

            // forget pass
            SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.end,
                'forget password?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'login',
            ),

            const SizedBox(
              height: 15,
            ),

            CustomButton(
              text: 'Create Account',
              onPressed: () {},
            ),
          ],
        ));
  }
}
