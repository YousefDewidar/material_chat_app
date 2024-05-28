import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/all_views.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class ForgetPassView extends StatefulWidget {
  const ForgetPassView({super.key});

  @override
  State<ForgetPassView> createState() => _ForgetPassViewState();
}

class _ForgetPassViewState extends State<ForgetPassView> {
  final TextEditingController emailCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
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
                'Reset password,',
                style: TextStyle(fontSize: 36),
              ),

              const SizedBox(
                height: 18,
              ),

              const Text(
                'Please enter your email',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
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
                text: 'Send email',
                onPressed: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailCon.text)
                      .then((value) {
                    Navigator.pop(context);
                    return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Email sent check your email')));
                  }).onError((error, stackTrace) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  });
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
