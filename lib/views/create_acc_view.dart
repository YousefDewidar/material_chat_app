import 'package:flutter/material.dart';
import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/views/all_views.dart';
import 'package:material_chat_app/widgets/custom_button.dart';
import 'package:material_chat_app/widgets/custom_text_field.dart';

class CreateAccView extends StatefulWidget {
  const CreateAccView({super.key});

  @override
  State<CreateAccView> createState() => _CreateAccViewState();
}

class _CreateAccViewState extends State<CreateAccView> {
final TextEditingController nameCon = TextEditingController();
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
                height: 12,
              ),
              // Welcome
              const Text(
                'Welcome,',
                style: TextStyle(fontSize: 40),
              ),

              Text(
                'Material Chat App',
                style: Theme.of(context).textTheme.bodyLarge,
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
                controller:nameCon ,
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllViews(),
                        ),
                        (route) => false);
                  }, color: kPrimaryColor,)
            ],
          ),
        ),
      ),
    );
  }
}
