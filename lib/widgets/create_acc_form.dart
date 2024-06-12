// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class CreateAccForm extends StatefulWidget {
  const CreateAccForm({super.key});

  @override
  State<CreateAccForm> createState() => _CreateAccFormState();
}

class _CreateAccFormState extends State<CreateAccForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            // email
            CustomTextField(
              label: 'Email',
              icon: Icons.email_outlined,
              controller: emailCon,
            ),

            const SizedBox(
              height: 15,
            ),
            // password
            CustomTextField(
              label: 'Password',
              icon: Icons.password,
              controller: passwordCon,
            ),

            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await register(emailCon, passwordCon);
                    showSnackBar(context, 'Created done');
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    handleShowErrors(e, context);
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Next',
              color: kPrimaryColor,
            ),
          ],
        ));
  }

  void handleShowErrors(FirebaseAuthException e, BuildContext context) {
    if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'email-already-in-use');
    } else if (e.code == 'invalid-email') {
      showSnackBar(context, 'invalid email');
    } else if (e.code == 'weak-password') {
      showSnackBar(context, 'weak password');
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
    ));
  }
}

Future<void> register(emailCon, passwordCon) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailCon.text, password: passwordCon.text);
}
