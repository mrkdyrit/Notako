import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/firebase_options.dart';
import 'package:notako_app/screens/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'DM-Sans'
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}