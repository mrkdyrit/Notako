import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notakoAppBar(),
      drawer: notakoDrawer(context, changeScreen),
      body: screenList[shownScreen],
    );
  }
}