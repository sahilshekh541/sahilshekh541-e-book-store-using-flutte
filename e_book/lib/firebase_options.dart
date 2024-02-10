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
    apiKey: 'AIzaSyA7QND3KgGdph3Yia296ae1xybL-sgj-hY',
    appId: '1:808095743949:web:15dadb72a3541ee2b18e84',
    messagingSenderId: '808095743949',
    projectId: 'e-bookstore-f9b9a',
    authDomain: 'e-bookstore-f9b9a.firebaseapp.com',
    storageBucket: 'e-bookstore-f9b9a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP9e6sjJTuz1sSpyC6GcWx8-lo4bMORqo',
    appId: '1:808095743949:android:765c765c6d2445edb18e84',
    messagingSenderId: '808095743949',
    projectId: 'e-bookstore-f9b9a',
    storageBucket: 'e-bookstore-f9b9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMlIy63BByEt7_bfGPh5wrwLghrgM6QUc',
    appId: '1:808095743949:ios:8aec4cfcda4a7404b18e84',
    messagingSenderId: '808095743949',
    projectId: 'e-bookstore-f9b9a',
    storageBucket: 'e-bookstore-f9b9a.appspot.com',
    iosBundleId: 'com.example.eBook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMlIy63BByEt7_bfGPh5wrwLghrgM6QUc',
    appId: '1:808095743949:ios:169d4c40b043769cb18e84',
    messagingSenderId: '808095743949',
    projectId: 'e-bookstore-f9b9a',
    storageBucket: 'e-bookstore-f9b9a.appspot.com',
    iosBundleId: 'com.example.eBook.RunnerTests',
  );
}