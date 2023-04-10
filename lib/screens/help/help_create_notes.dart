import 'package:flutter/material.dart';

class HelpCreateNotesScreen extends StatefulWidget {
  const HelpCreateNotesScreen({super.key});

  @override
  State<HelpCreateNotesScreen> createState() => HelpCreateNotesScreenState();
}

class HelpCreateNotesScreenState extends State<HelpCreateNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('help screen'),
      ),
    );  
  }
}