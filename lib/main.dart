import 'package:firebase_2/screens/home.dart';
import 'package:firebase_2/screens/login.dart';
import 'package:firebase_2/screens/plash_screens.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        '/': (context) => const HomePage(),
        'login_page': (context) => const LoginPage(),
      },
    ),
  );
}
