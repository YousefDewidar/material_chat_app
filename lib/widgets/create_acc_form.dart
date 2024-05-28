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
  final TextEditingController nameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            // name
            CustomTextField(
              label: 'Name',
              icon: Icons.person,
              controller: nameCon,
            ),

            const SizedBox(
              height: 15,
            ),

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
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailCon.text, password: passwordCon.text)
                      .then((value) {
                    return Navigator.pop(context);
                  }).onError((error, stackTrace) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString()))));
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Create Account',
              color: kPrimaryColor,
            ),

            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
