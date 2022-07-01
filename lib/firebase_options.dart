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
    apiKey: 'AIzaSyCZMizrLIKqQpyBPDxVnxuHIKdo5qmjjqA',
    appId: '1:688324632013:web:d3305c1d50c2666dd1f884',
    messagingSenderId: '688324632013',
    projectId: 'fuel-token-007',
    authDomain: 'fuel-token-007.firebaseapp.com',
    storageBucket: 'fuel-token-007.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpa4ao_2Obl-Qe2LOp1RyssVdoc6zLzew',
    appId: '1:688324632013:android:df5c3e3bd57d62ded1f884',
    messagingSenderId: '688324632013',
    projectId: 'fuel-token-007',
    storageBucket: 'fuel-token-007.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYiwTPQ0YHHVK-nB5YCxU25lt9b6_f1Xk',
    appId: '1:688324632013:ios:7a15fc42189abf7bd1f884',
    messagingSenderId: '688324632013',
    projectId: 'fuel-token-007',
    storageBucket: 'fuel-token-007.appspot.com',
    iosClientId: '688324632013-dl2vqtk6t4oevu4ska461kpimnmtnv6p.apps.googleusercontent.com',
    iosBundleId: 'com.example.fuelTokenApp',
  );
}