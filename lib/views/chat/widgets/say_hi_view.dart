import 'package:flutter/material.dart';
class SayHiWidget extends StatelessWidget {
  const SayHiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 210),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '👋',
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Say Hi',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
