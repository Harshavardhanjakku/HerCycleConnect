import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
      default:
        return web;
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '...',
    appId: 'com.example.hercycleplus',
    messagingSenderId: '...',
    projectId: 'hercycle-fe88c',
    storageBucket: '...',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '...',
    appId: 'com.example.hercycleplus',
    messagingSenderId: '...',
    projectId: 'hercycle-fe88c',
    storageBucket: '...',
    iosBundleId: 'com.example.hercycleplus',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: 'hercycle-fe88c',
    authDomain: 'hercycle-fe88c.firebaseapp.com',
    storageBucket: 'hercycle-fe88c.appspot.com',
    measurementId: '...',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: 'hercycle-fe88c',
    authDomain: 'hercycle-fe88c.firebaseapp.com',
    storageBucket: 'hercycle-fe88c.appspot.com',
  );
}