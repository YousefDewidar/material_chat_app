// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBka3xED1GXH52-TsA7lX6smNomVGUQDUY',
    appId: '1:261483497374:web:0b6eade0d2723a266cb88f',
    messagingSenderId: '261483497374',
    projectId: 'chat-material3-c8627',
    authDomain: 'chat-material3-c8627.firebaseapp.com',
    storageBucket: 'chat-material3-c8627.appspot.com',
    measurementId: 'G-XCMZC18XKJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDqk6IHaiNF3rz4VwQsf464tP-aTShsEk',
    appId: '1:261483497374:android:db5e53fe015a8a086cb88f',
    messagingSenderId: '261483497374',
    projectId: 'chat-material3-c8627',
    storageBucket: 'chat-material3-c8627.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBj8mVgzF6hptDRsRS-8rPqbKpuqq51lPw',
    appId: '1:261483497374:ios:f17ca635a7f8043d6cb88f',
    messagingSenderId: '261483497374',
    projectId: 'chat-material3-c8627',
    storageBucket: 'chat-material3-c8627.appspot.com',
    iosBundleId: 'com.example.materialChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBj8mVgzF6hptDRsRS-8rPqbKpuqq51lPw',
    appId: '1:261483497374:ios:f17ca635a7f8043d6cb88f',
    messagingSenderId: '261483497374',
    projectId: 'chat-material3-c8627',
    storageBucket: 'chat-material3-c8627.appspot.com',
    iosBundleId: 'com.example.materialChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBka3xED1GXH52-TsA7lX6smNomVGUQDUY',
    appId: '1:261483497374:web:d8c0ba47e6dd33df6cb88f',
    messagingSenderId: '261483497374',
    projectId: 'chat-material3-c8627',
    authDomain: 'chat-material3-c8627.firebaseapp.com',
    storageBucket: 'chat-material3-c8627.appspot.com',
    measurementId: 'G-0XEFP0CMC8',
  );
}
