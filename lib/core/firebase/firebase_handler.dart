import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @LazySingleton()
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}


initilizeFirebase() async {
  await Firebase.initializeApp(
    options:
    kIsWeb ? FirebaseOptions(
        apiKey: "AIzaSyCCC01Xdaepi785dnsqbtN0-AhFM6vN4Y8",
        authDomain: "landmark-cf5cb.firebaseapp.com",
        projectId: "landmark-cf5cb",
        storageBucket: "landmark-cf5cb.firebasestorage.app",
        messagingSenderId: "455647601344",
        appId: "1:455647601344:web:76ed3a62312a7d2591c325",
        measurementId: "G-YKC2V0E77X"
    )
        : null,
  );
}