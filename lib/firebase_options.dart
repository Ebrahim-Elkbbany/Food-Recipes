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
    apiKey: 'AIzaSyCUMKiXiNgIwDDEj_CeyV8PDBjhW1F0hXo',
    appId: '1:810969299708:android:de902eb9d9c67a5f6db579',
    messagingSenderId: '810969299708',
    projectId: 'food-recipe-78668',
    storageBucket: 'food-recipe-78668.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnuCdINDRYR-LR3BO7rpk1wxTKKTa4mUM',
    appId: '1:810969299708:ios:d0ed86d0d26789ec6db579',
    messagingSenderId: '810969299708',
    projectId: 'food-recipe-78668',
    storageBucket: 'food-recipe-78668.appspot.com',
    androidClientId: '810969299708-gev1mne0t23lk0sc9sf8kktgve38hmo3.apps.googleusercontent.com',
    iosClientId: '810969299708-mqas5t40kl5h2roa7gpf5jk5np6o2h8o.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodRecipes',
  );
}
