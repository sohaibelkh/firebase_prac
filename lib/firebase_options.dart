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
    apiKey: 'AIzaSyCPnUm728qwe_4ZQ33cSs4nE7y3f3ak6HM',
    appId: '1:167696391247:web:32a3cb0d08ab1472cf1e3a',
    messagingSenderId: '167696391247',
    projectId: 'mychatapp-85f30',
    authDomain: 'mychatapp-85f30.firebaseapp.com',
    storageBucket: 'mychatapp-85f30.appspot.com',
    measurementId: 'G-7JTH97M5QC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgyNkUWN6CM0lrZ_Y8e-BKDoqlIqjW3ws',
    appId: '1:167696391247:android:c5d853278e7e4672cf1e3a',
    messagingSenderId: '167696391247',
    projectId: 'mychatapp-85f30',
    storageBucket: 'mychatapp-85f30.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKF7m6SqcCyRntkG09MVda7DcERbcnuHY',
    appId: '1:167696391247:ios:4c2d11a7f86153edcf1e3a',
    messagingSenderId: '167696391247',
    projectId: 'mychatapp-85f30',
    storageBucket: 'mychatapp-85f30.appspot.com',
    iosBundleId: 'com.example.firebasePrac',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKF7m6SqcCyRntkG09MVda7DcERbcnuHY',
    appId: '1:167696391247:ios:d55d5f938abc6e7bcf1e3a',
    messagingSenderId: '167696391247',
    projectId: 'mychatapp-85f30',
    storageBucket: 'mychatapp-85f30.appspot.com',
    iosBundleId: 'com.example.firebasePrac.RunnerTests',
  );
}
