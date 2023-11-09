import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAH-cn5LNpCjtDH80ltzFCtpDaq5WTz_9w",
            authDomain: "sgbd-nisidental.firebaseapp.com",
            projectId: "sgbd-nisidental",
            storageBucket: "sgbd-nisidental.appspot.com",
            messagingSenderId: "454458254376",
            appId: "1:454458254376:web:d9a416c2ed360d95d0c11d",
            measurementId: "G-V4KRJWZSPY"));
  } else {
    await Firebase.initializeApp();
  }
}
