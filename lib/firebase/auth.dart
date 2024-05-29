import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_chat_app/models/user_model.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static User user = auth.currentUser!;

  static Future createUser() async {
    ChatUserModel chatUserModel = ChatUserModel(
        id: user.uid,
        name: user.displayName,
        email: user.email,
        createdAt: DateTime.now().toString(),
        lastActivated: DateTime.now().toString(),
        pushToken: '',
        online: false,
        about: "I'am yousef dewidar",
        image: '');

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(chatUserModel.toJson());
  }
}
