import 'package:flutter/material.dart';
import 'package:notako_app/screens/help/help_create_notes.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Widget> helpPageSlides = [
    const HelpCreateNotesScreen(),
    const HelpCreateNotesScreen(),
  ];

  final pageViewController = PageController(viewportFraction: 1.1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: helpPageSlides.length,
              controller: pageViewController,
              itemBuilder: (context, index) {
                return FractionallySizedBox(
                  widthFactor: 1 / pageViewController.viewportFraction,
                  child: helpPageSlides[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: notako_color.Colors.secondaryColor,
                padding: const EdgeInsets.all(15),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                pageViewController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
              }, 
              child: const Text('Next')
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8,),
            child: Center(
              child: Text('. . .'),
            ),
          )
        ],
      )
    );
  }
}