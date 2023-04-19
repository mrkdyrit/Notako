import 'dart:async';
import 'dart:collection';
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

  // Initialize to the 'home' screen of the app.
  Widget shownScreen = const NoteScreen();

  void changeScreen(Widget screenToShow) {
    setState(() {
      shownScreen = screenToShow;
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
    final List<Map<String, dynamic>> screenList = [
      {
        'name': 'My Notes',
        'details':  {
          'icon': Icons.description,
          'screen': const NoteScreen(),
        },
      },
      {
        'name': 'Note Tags',
        'details':  {
          'icon': Icons.discount,
          'screen': const TagsScreen(),
        },
      },
      {
        'name': 'Settings',
        'details':  {
          'icon': Icons.settings,
          'screen': const SettingScreen(),
        },
      },
      // {
      //   'name': 'Help',
      //   'details':  {
      //     'icon': Icons.question_mark,
      //     'screen': const HelpScreen(),
      //   },
      // },
    ];

    return Scaffold(
      key: homeScaffoldKey,
      appBar: const NotakoAppBar(),
      drawer: NotakoNavDrawer(
        screenList: screenList,
        changeScreen: changeScreen
      ),
      body: shownScreen,
    );
  }
} 