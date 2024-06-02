import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/create_acc_view.dart';
import 'package:material_chat_app/views/forget_pass_view.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool isLoading = false;

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
            isLoading
                ? SizedBox(
                    height: 50,
                    child: ModalProgressHUD(
                        color: kPrimaryColor,
                        inAsyncCall: isLoading,
                        child: const SizedBox(
                          height: 0,
                        )),
                  )
                : CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          await signInMethod();
                        } on FirebaseAuthException catch (e) {
                          handleShowErrors(e, context);
                        }
                        isLoading = false;
                        setState(() {});
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

  Future<UserCredential> signInMethod() {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCon.text, password: passwordCon.text);
  }
}

void handleShowErrors(FirebaseAuthException e, BuildContext context) {
  if (e.code == 'wrong-password') {
    showSnackBar(context, 'wrong password');
  } else if (e.code == 'invalid-email') {
    showSnackBar(context, 'invalid email');
  } else {
    showSnackBar(context, 'Your email or password is wrong.');
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
