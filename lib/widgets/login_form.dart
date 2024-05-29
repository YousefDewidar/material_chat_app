import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/create_acc_view.dart';
import 'package:material_chat_app/views/forget_pass_view.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

            // forget pass
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPassView(),
                      )),
                  child: Text(
                    'Forget password?',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            // login
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailCon.text, password: passwordCon.text)
                      .then((value) {
                    return print('Login done');
                  }).onError((error, stackTrace) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString()))));
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'login',
              color: kPrimaryColor,
            ),

            const SizedBox(
              height: 15,
            ),

            // create acc
            CustomButton(
              text: 'Create Account',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CreateAccView();
                  },
                ));
              },
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ));
  }
}
