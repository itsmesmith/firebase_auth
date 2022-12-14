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
    apiKey: 'AIzaSyBgJs1QCJtyJ8zJZD1i8RqeD5I_12g25Fk',
    appId: '1:1035084213974:web:4ef0d6447ca06bf86c6377',
    messagingSenderId: '1035084213974',
    projectId: 'fir-4746f',
    authDomain: 'fir-4746f.firebaseapp.com',
    storageBucket: 'fir-4746f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYSRU7n2fE23jQ7vrGi_SxKvzgXCT8oZA',
    appId: '1:1035084213974:android:3c524e30824e892a6c6377',
    messagingSenderId: '1035084213974',
    projectId: 'fir-4746f',
    storageBucket: 'fir-4746f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBN4q_3laPW6iOAkrBBgS5qCWeUh6mzm8',
    appId: '1:1035084213974:ios:7d66523f8c7286386c6377',
    messagingSenderId: '1035084213974',
    projectId: 'fir-4746f',
    storageBucket: 'fir-4746f.appspot.com',
    iosClientId: '1035084213974-l92o5s8m39n8nantek68sinrie8r9m11.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBN4q_3laPW6iOAkrBBgS5qCWeUh6mzm8',
    appId: '1:1035084213974:ios:7d66523f8c7286386c6377',
    messagingSenderId: '1035084213974',
    projectId: 'fir-4746f',
    storageBucket: 'fir-4746f.appspot.com',
    iosClientId: '1035084213974-l92o5s8m39n8nantek68sinrie8r9m11.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );
}
