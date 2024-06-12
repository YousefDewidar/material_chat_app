import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  sendImage({required File file}) async {
    final exe = file.path.split('.').last; // jpg
    final ref = firebaseStorage.ref().child('images.$exe');
    ref.putFile(file);
    var imgUrl = await ref.getDownloadURL();
    return imgUrl;
  }
}
