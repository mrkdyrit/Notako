import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/accounts/login.dart';
import 'package:notako_app/screens/help/help.dart';
import 'package:notako_app/screens/notes/notes.dart';
import 'package:notako_app/screens/settings/settings.dart';
import 'package:notako_app/screens/tags/tags.dart';
import 'package:notako_app/widgets/notako_appbar.dart';
import 'package:notako_app/widgets/notako_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeScaffoldKey = GlobalKey();

  int shownScreen = 0;

  List<Widget> screenList = [
    const NoteScreen(),
    const TagsScreen(),
    const HelpScreen(),
    const SettingScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      shownScreen = index;
    });
  }

  late Stream<User?> _authStateStream;
  late StreamSubscription<User?> _authStateSubscription;

  @override
  void initState() {
    super.initState();

    _authStateStream = FirebaseAuth.instance.authStateChanges();
    _authStateSubscription = _authStateStream.listen((User? user) {
      if (user == null) {
        if(mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          _authStateSubscription.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _authStateStream.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: notakoAppBar(),
      drawer: notakoDrawer(context, changeScreen),
      body: screenList[shownScreen],
    );
  }
}