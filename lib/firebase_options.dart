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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCD7nwpRHhP_HRBJEmaQEz2dRcfxxcgIc4',
    appId: '1:208306386817:android:1fb261cc7dcf6cabf75a80',
    messagingSenderId: '208306386817',
    projectId: 'kelimbo',
    storageBucket: 'kelimbo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChjcbcfVB-YolP71bP_KFZRef1VPrWpHk',
    appId: '1:208306386817:ios:c70c831cf1ff8839f75a80',
    messagingSenderId: '208306386817',
    projectId: 'kelimbo',
    storageBucket: 'kelimbo.appspot.com',
    iosBundleId: 'com.example.marketplace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChjcbcfVB-YolP71bP_KFZRef1VPrWpHk',
    appId: '1:208306386817:ios:c70c831cf1ff8839f75a80',
    messagingSenderId: '208306386817',
    projectId: 'kelimbo',
    storageBucket: 'kelimbo.appspot.com',
    iosBundleId: 'com.example.marketplace',
  );
}
