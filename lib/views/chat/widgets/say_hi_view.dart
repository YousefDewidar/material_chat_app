import 'package:flutter/material.dart';

class SayHiView extends StatelessWidget {
  const SayHiView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('👋',style: TextStyle(fontSize: 60),),
            SizedBox(height: 8,),
            Text('Say Hi',style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
