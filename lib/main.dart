import 'package:flutter/material.dart';
import 'package:notako_app/screens/accounts/login.dart';
// import 'package:notako_app/screens/accounts/signup.dart';
// import 'package:notako_app/screens/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}