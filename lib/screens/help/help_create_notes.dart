import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/help/help_screen_template.dart';
import 'package:notako_app/widgets/help/images/help_create_notes_image_builder.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class HelpCreateNotesScreen extends StatefulWidget {
  const HelpCreateNotesScreen({super.key});

  @override
  State<HelpCreateNotesScreen> createState() => _HelpCreateNotesScreenState();
}

class _HelpCreateNotesScreenState extends State<HelpCreateNotesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return helpScreenTemplate(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      headerImage: helpCreateNotesImage(
        imageHeight: screenHeight > 700 ? screenHeight * 0.4: 300,
        imageWidth: screenWidth,
      ),
      helpTitle: 'Creating notes is easy!',
      helpDescription: [
        RichText(
          text: TextSpan(
            style: NotakoTypography.mutedText.copyWith(
              fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
            ),
            children: const [
              TextSpan(text: 'The floating '),
              TextSpan(
                text: '+', 
                style: TextStyle(
                  color: notako_color.Colors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' button provides an easy way to create your notes. Simply tap on it to create a new note in no time!'),
            ]
          ),
        ),
      ]
    );
  }
}