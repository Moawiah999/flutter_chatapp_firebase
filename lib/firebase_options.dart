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
        return macos;
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
    apiKey: 'AIzaSyBdcDCxXh1MEXC2uoY1NjqOy_OtcGHdDmQ',
    appId: '1:837418738646:web:9ec6ba5d81976c116cfa77',
    messagingSenderId: '837418738646',
    projectId: 'chat-app-flutter-chating',
    authDomain: 'chat-app-flutter-chating.firebaseapp.com',
    storageBucket: 'chat-app-flutter-chating.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPd0BV3UgNG_GH1BfL4bp3lFWf05LMtZA',
    appId: '1:837418738646:android:477f3b98a6d9ff476cfa77',
    messagingSenderId: '837418738646',
    projectId: 'chat-app-flutter-chating',
    storageBucket: 'chat-app-flutter-chating.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAruyJ9epqHg5UidcwKqb_q1sHS2C6w-Oc',
    appId: '1:837418738646:ios:6b5d9bf5051232346cfa77',
    messagingSenderId: '837418738646',
    projectId: 'chat-app-flutter-chating',
    storageBucket: 'chat-app-flutter-chating.appspot.com',
    iosClientId: '837418738646-ifcafchjukualsl5fq7eu2hvg1eup630.apps.googleusercontent.com',
    iosBundleId: 'com.example.mychatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAruyJ9epqHg5UidcwKqb_q1sHS2C6w-Oc',
    appId: '1:837418738646:ios:6b5d9bf5051232346cfa77',
    messagingSenderId: '837418738646',
    projectId: 'chat-app-flutter-chating',
    storageBucket: 'chat-app-flutter-chating.appspot.com',
    iosClientId: '837418738646-ifcafchjukualsl5fq7eu2hvg1eup630.apps.googleusercontent.com',
    iosBundleId: 'com.example.mychatapp',
  );
}
