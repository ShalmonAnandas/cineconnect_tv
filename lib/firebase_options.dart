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
        return windows;
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
    apiKey: 'AIzaSyByV3nP-7Y372DQcwot9tyIOfVMMkMSXSA',
    appId: '1:483939051115:web:ce97d254fa5b0580d0732e',
    messagingSenderId: '483939051115',
    projectId: 'cineconnect-tv-shalmon',
    authDomain: 'cineconnect-tv-shalmon.firebaseapp.com',
    storageBucket: 'cineconnect-tv-shalmon.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOOQl5seh8PAc5meuNwDRHtPWOuNv0IPc',
    appId: '1:483939051115:android:3d1d7dd169015461d0732e',
    messagingSenderId: '483939051115',
    projectId: 'cineconnect-tv-shalmon',
    storageBucket: 'cineconnect-tv-shalmon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJIcf0cWSG80BoRjWbZixems0qPbYMByA',
    appId: '1:483939051115:ios:0cfb142812b06f04d0732e',
    messagingSenderId: '483939051115',
    projectId: 'cineconnect-tv-shalmon',
    storageBucket: 'cineconnect-tv-shalmon.appspot.com',
    iosBundleId: 'com.example.cineconnectTv',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJIcf0cWSG80BoRjWbZixems0qPbYMByA',
    appId: '1:483939051115:ios:0cfb142812b06f04d0732e',
    messagingSenderId: '483939051115',
    projectId: 'cineconnect-tv-shalmon',
    storageBucket: 'cineconnect-tv-shalmon.appspot.com',
    iosBundleId: 'com.example.cineconnectTv',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyByV3nP-7Y372DQcwot9tyIOfVMMkMSXSA',
    appId: '1:483939051115:web:3918a4c7c9c5aa79d0732e',
    messagingSenderId: '483939051115',
    projectId: 'cineconnect-tv-shalmon',
    authDomain: 'cineconnect-tv-shalmon.firebaseapp.com',
    storageBucket: 'cineconnect-tv-shalmon.appspot.com',
  );
}
