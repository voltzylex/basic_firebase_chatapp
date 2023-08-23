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
    apiKey: 'AIzaSyD9_Af_gaYHGLxnpxuCwkhZ6DUBeVx_HU8',
    appId: '1:191556904357:web:743499a57c36379622b44c',
    messagingSenderId: '191556904357',
    projectId: 'basic-chat-18f35',
    authDomain: 'basic-chat-18f35.firebaseapp.com',
    storageBucket: 'basic-chat-18f35.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIJHjvKuSlTcYSIpN0K9LZMOgU-pCnqNw',
    appId: '1:191556904357:android:d6da073014000a0722b44c',
    messagingSenderId: '191556904357',
    projectId: 'basic-chat-18f35',
    storageBucket: 'basic-chat-18f35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9ZUpQ0GCWGA1nrkmQTPoMeo5Hduwp-Zc',
    appId: '1:191556904357:ios:a7a1274961e755d122b44c',
    messagingSenderId: '191556904357',
    projectId: 'basic-chat-18f35',
    storageBucket: 'basic-chat-18f35.appspot.com',
    iosClientId: '191556904357-tqsl1ujgfqpl3f7don11pnnmfcnj0jfq.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatApp',
  );
}