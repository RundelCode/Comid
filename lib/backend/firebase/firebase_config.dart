import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDcsCrsixwFwbJXhFMAWQ372L1twWfaYwA",
            authDomain: "comid-2c772.firebaseapp.com",
            projectId: "comid-2c772",
            storageBucket: "comid-2c772.appspot.com",
            messagingSenderId: "322044937128",
            appId: "1:322044937128:web:f2671443f2ff7095bf939d",
            measurementId: "G-CMC6VZFMQL"));
  } else {
    await Firebase.initializeApp();
  }
}
