import 'package:flutter/material.dart';

class ContactHomeView extends StatefulWidget {
  const ContactHomeView({super.key});

  @override
  State<ContactHomeView> createState() => _ContactHomeViewState();
}

class _ContactHomeViewState extends State<ContactHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Contacts',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
        
    
    
    );
  }
}