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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpRoGSUYXPkYMRD2xf33WC2IxdRSE0fXU',
    appId: '1:634234166008:android:78f7d487cb47e0a643b90d',
    messagingSenderId: '634234166008',
    projectId: 'homegram-9da3e',
    storageBucket: 'homegram-9da3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBymhHy2jeYM3tL275TillyoiRLfKDDc8w',
    appId: '1:634234166008:ios:8911275c7f95443843b90d',
    messagingSenderId: '634234166008',
    projectId: 'homegram-9da3e',
    storageBucket: 'homegram-9da3e.appspot.com',
    androidClientId: '634234166008-hvjn3ln1m7855vovgcsma4bpqg0q67ud.apps.googleusercontent.com',
    iosClientId: '634234166008-ba2glcachvpdmh1afang5vr3domhca35.apps.googleusercontent.com',
    iosBundleId: 'babycare.birthdayApp',
  );
}
