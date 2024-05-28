import 'package:flutter/material.dart';
import 'package:material_chat_app/widgets/create_acc_form.dart';


class CreateAccView extends StatelessWidget {
  const CreateAccView({super.key});

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

              const CreateAccForm()

    ],
          ),
        ),
      ),
    );
  }
}
