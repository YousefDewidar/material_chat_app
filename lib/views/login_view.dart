import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              // logo image
              SvgPicture.asset(
                'assets/images/n_logo.svg',
                height: 200,
                color: kPrimaryColor,
              ),

              const SizedBox(
                height: 12,
              ),
              // Welcome
              Text(
                'Welcome Back,',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              Text(
                'Material Chat App with Yousef Dewidar',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(
                height: 15,
              ),

              const CustomForm(),
            ],
          ),
        ),
      ),
    );
  }
}
