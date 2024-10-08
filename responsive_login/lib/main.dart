import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_login/Login%20Signup/Screen/home_screen.dart';
import 'package:responsive_login/Login%20Signup/Screen/login.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // comment for run in android
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAO48oWFXqa7I36SxO8as9Bl4rG9WFL7m4', 
      appId: '1:707621383027:web:c5f31909dd1579b5a1b306', 
      messagingSenderId: '707621383027', 
      projectId: 'flutter-project-12038',
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

