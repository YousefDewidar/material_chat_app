import 'package:flutter/material.dart';

class GroupHomeView extends StatefulWidget {
  const GroupHomeView({super.key});

  @override
  State<GroupHomeView> createState() => _GroupHomeViewState();
}

class _GroupHomeViewState extends State<GroupHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Groups',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
        
    
    
    );
  }
}