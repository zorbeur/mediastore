import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/auth/login.dart';
import 'screens/auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MediastoreApp());
}

class MediastoreApp extends StatelessWidget {
  const MediastoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mediastore',
      theme: ThemeData(primarySwatch: Colors.orange),
      // Définir les routes pour navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );


    class MediastoreApp extends StatelessWidget {
    const MediastoreApp({super.key});

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Mediastore',
    theme: ThemeData(primarySwatch: Colors.orange),
    initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/',
    routes: {
    '/': (context) => const HomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignupScreen(),
    },
    );
    }
    }

  }
}
