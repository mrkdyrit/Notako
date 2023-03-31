import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/accounts/login.dart';
import 'package:notako_app/screens/notes/notes.dart';
import 'package:notako_app/screens/settings/settings.dart';
import 'package:notako_app/screens/tags/tags.dart';
import 'package:notako_app/utils/snackbar_util.dart';
import 'package:notako_app/widgets/notako_appbar.dart';
import 'package:notako_app/widgets/notako_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int shownScreen = 0;

  List<Widget> screenList = [
    const NoteScreen(),
    const TagsScreen(),
    const SettingScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      shownScreen = index;
    });
  }

  late Stream<User?> _authStateStream;

  @override
  void initState() {
    super.initState();

    _authStateStream = FirebaseAuth.instance.authStateChanges();
    _authStateStream.listen((User? user) {
      if (user == null) {
        // redirect to sign-in page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
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
      appBar: notakoAppBar(),
      drawer: notakoDrawer(context, changeScreen),
      body: screenList[shownScreen],
    );
  }
}