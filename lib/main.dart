import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_chat_app/firebase_options.dart';
import 'package:material_chat_app/provider/provider.dart';
import 'package:material_chat_app/views/add_name_view.dart';
import 'package:material_chat_app/views/all_views.dart';
import 'package:material_chat_app/views/login_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: Consumer<MyProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Marerial3 Chat App',
          debugShowCheckedModeBanner: false,
          themeMode: value.mode,
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor:value.themeCol, brightness: Brightness.dark),
          ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: value.themeCol),
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (FirebaseAuth.instance.currentUser!.displayName == '' ||
                    FirebaseAuth.instance.currentUser!.displayName == null) {
                  return const AddNameView();
                } else {
                  return const AllViews();
                }
              } else {
                return const LoginView();
              }
            },
          ),
        ),
      ),
    );
  }
}
