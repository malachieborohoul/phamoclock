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
    apiKey: 'AIzaSyCl7HtfafEreuBFHJgOR5xHaK64YkRKguc',
    appId: '1:300704070562:web:c9072056eb956c2bb590fb',
    messagingSenderId: '300704070562',
    projectId: 'pharmoclock-ccbc0',
    authDomain: 'pharmoclock-ccbc0.firebaseapp.com',
    storageBucket: 'pharmoclock-ccbc0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCns3LU-8goJ2LGD1G2iyWiIUwZxHKdVMs',
    appId: '1:300704070562:android:fbf5d2a215b9ba94b590fb',
    messagingSenderId: '300704070562',
    projectId: 'pharmoclock-ccbc0',
    storageBucket: 'pharmoclock-ccbc0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMjzI-SKNmyMPTu95seGEmuxHpbOJAyAw',
    appId: '1:300704070562:ios:490f48dd858a0ac9b590fb',
    messagingSenderId: '300704070562',
    projectId: 'pharmoclock-ccbc0',
    storageBucket: 'pharmoclock-ccbc0.appspot.com',
    iosClientId: '300704070562-kq3mct5hf6e7f7olvhk09prvmdd8oguv.apps.googleusercontent.com',
    iosBundleId: 'com.example.phamoclock',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMjzI-SKNmyMPTu95seGEmuxHpbOJAyAw',
    appId: '1:300704070562:ios:490f48dd858a0ac9b590fb',
    messagingSenderId: '300704070562',
    projectId: 'pharmoclock-ccbc0',
    storageBucket: 'pharmoclock-ccbc0.appspot.com',
    iosClientId: '300704070562-kq3mct5hf6e7f7olvhk09prvmdd8oguv.apps.googleusercontent.com',
    iosBundleId: 'com.example.phamoclock',
  );
}