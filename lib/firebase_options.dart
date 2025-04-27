import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBn_ACYGxlQHiVtjmfUM4G9IZK9NTIy7ig",
    appId: "1:873935306373:web:00c8a5d7869447eec373ec",
    messagingSenderId: "873935306373",
    projectId: "hercycle-fe88c",
    authDomain: "hercycle-fe88c.firebaseapp.com",
    storageBucket: "hercycle-fe88c.firebasestorage.app",
    measurementId: "G-L064FBJFFD",
  );
}