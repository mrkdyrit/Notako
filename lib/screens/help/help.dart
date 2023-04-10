import 'package:flutter/material.dart';
import 'package:notako_app/screens/help/help_create_notes.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Widget> helpPageSlides = [
    const HelpCreateNotesScreen()
  ];

  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: helpPageSlides.length,
        controller: pageViewController,
        itemBuilder: (context, index) {
          return helpPageSlides[index];
        },
      ),
    );
  }
}