// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAFSOKOLrmH3i9QgOVJfc7gR9N_UGo70H4',
    appId: '1:516196794136:web:1d1e26d791743684c9e86d',
    messagingSenderId: '516196794136',
    projectId: 'group-chat-6b921',
    authDomain: 'group-chat-6b921.firebaseapp.com',
    storageBucket: 'group-chat-6b921.appspot.com',
    measurementId: 'G-45J2KDG01W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuxAY83hnQVjpk4RQFH1ktng7TuUAL8So',
    appId: '1:516196794136:android:bc284af88347cd25c9e86d',
    messagingSenderId: '516196794136',
    projectId: 'group-chat-6b921',
    storageBucket: 'group-chat-6b921.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7MGgzQPmPKPb7DRS2JSQKGKmjsPUYUIM',
    appId: '1:516196794136:ios:4fb0826a6b90e2c8c9e86d',
    messagingSenderId: '516196794136',
    projectId: 'group-chat-6b921',
    storageBucket: 'group-chat-6b921.appspot.com',
    iosBundleId: 'com.chat.myChat',
  );
}
