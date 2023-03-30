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
    apiKey: 'AIzaSyDUSBr32qPGufqMCxCJzkUh8FL01X8DHcs',
    appId: '1:243744048794:web:31c671f8891cbcecc78123',
    messagingSenderId: '243744048794',
    projectId: 'notako-bed89',
    authDomain: 'notako-bed89.firebaseapp.com',
    storageBucket: 'notako-bed89.appspot.com',
    measurementId: 'G-2HP5EKLSB3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmbe8SI3DDTdK2lhCWtjiqtBwNNe4opB4',
    appId: '1:243744048794:android:49fa0d0f390f1372c78123',
    messagingSenderId: '243744048794',
    projectId: 'notako-bed89',
    storageBucket: 'notako-bed89.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-G_sCehK9gqNbbff-zMNYXWUo8BsJbj4',
    appId: '1:243744048794:ios:a652b3879f08c919c78123',
    messagingSenderId: '243744048794',
    projectId: 'notako-bed89',
    storageBucket: 'notako-bed89.appspot.com',
    iosClientId: '243744048794-fa9vo2mvtbf8jhfljkld25mbufbgiota.apps.googleusercontent.com',
    iosBundleId: 'com.example.notakoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-G_sCehK9gqNbbff-zMNYXWUo8BsJbj4',
    appId: '1:243744048794:ios:a652b3879f08c919c78123',
    messagingSenderId: '243744048794',
    projectId: 'notako-bed89',
    storageBucket: 'notako-bed89.appspot.com',
    iosClientId: '243744048794-fa9vo2mvtbf8jhfljkld25mbufbgiota.apps.googleusercontent.com',
    iosBundleId: 'com.example.notakoApp',
  );
}