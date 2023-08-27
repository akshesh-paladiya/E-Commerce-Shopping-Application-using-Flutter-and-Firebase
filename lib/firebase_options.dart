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
    apiKey: 'AIzaSyCotc00FY7GLjnO_FzjsEMTQgBg1pf3Ul8',
    appId: '1:403191865173:web:00cb00f354645fbe0999dc',
    messagingSenderId: '403191865173',
    projectId: 'e-commerce-77b18',
    authDomain: 'e-commerce-77b18.firebaseapp.com',
    storageBucket: 'e-commerce-77b18.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3v8pt1ChqDA6BXB2F6kjj6aBB-PPHeXk',
    appId: '1:403191865173:android:7cbeaa641995ecff0999dc',
    messagingSenderId: '403191865173',
    projectId: 'e-commerce-77b18',
    storageBucket: 'e-commerce-77b18.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsyh7ThYUd6GjhH6eCVOzs9tLUjZohcXY',
    appId: '1:403191865173:ios:c5ff43877a278a4c0999dc',
    messagingSenderId: '403191865173',
    projectId: 'e-commerce-77b18',
    storageBucket: 'e-commerce-77b18.appspot.com',
    iosClientId: '403191865173-u2031hq2bg0ksv7l02ne45oi727k666u.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceShoppingApp',
  );
}
