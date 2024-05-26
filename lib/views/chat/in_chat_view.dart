import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Text(
              "last seen 11:45 am",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // text input & camera & emoji
                Expanded(
                  child: Card(
                    child: TextField(
                      
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.emoji_emotions_outlined),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            
                // button send
                IconButton.filled(onPressed: (){}, icon:const Icon(Icons.send))
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
