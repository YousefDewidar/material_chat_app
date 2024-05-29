import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/add_name_view.dart';
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
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailCon.text, password: passwordCon.text)
                      .then((value) {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddNameView(),
                        ));
                  }).onError((error, stackTrace) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString()))));
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
}
