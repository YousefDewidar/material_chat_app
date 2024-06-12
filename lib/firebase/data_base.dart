import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:material_chat_app/constant.dart';
import 'package:material_chat_app/firebase/auth.dart';

class DataBase {
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  sendMessage({required String msg}) {
    message.add(
        {kMessage: msg, kCreatedAt: DateTime.now(), 'from_id': Auth.user.uid});
  }
}