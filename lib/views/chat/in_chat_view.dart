import 'package:flutter/material.dart';

class InChatView extends StatefulWidget {
  const InChatView({super.key});

  @override
  State<InChatView> createState() => _InChatViewState();
}

class _InChatViewState extends State<InChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("yousef"),
            Text("last seen 11:45 am" ,style: Theme.of(context).textTheme.labelMedium,),
          ],
        ),
    
      actions: [
        IconButton(onPressed: (){}, icon:const Icon(Icons.delete)),
        IconButton(onPressed: (){}, icon:const Icon(Icons.copy)),
      ],
      ),
  
      
    );
  }
}
