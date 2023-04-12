import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
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
    // return Scaffold(
    //   body: ListView(
    //     children: [
    //       helpCreateNotesImage(
    //         imageHeight: 300,
    //         imageWidth: MediaQuery.of(context).size.width,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
    //         child: Text(
    //           'Creating notes is easy!',
    //           style: FontTypography.heading1.copyWith(color: notako_color.Colors.secondaryColor),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
    //         child: RichText(
    //           text: const TextSpan(
    //             style: FontTypography.mutedText3,
    //             children: [
    //               TextSpan(text: 'The floating '),
    //               TextSpan(text: '+', style: TextStyle(color: notako_color.Colors.secondaryColor)),
    //               TextSpan(text: ' button provides an easy way to create your notes. Simply tap on it to create a new note in no time!'),
    //             ]
    //           ),
    //         )
    //       ),
    //     ],
    //   ),
    // );

    return helpScreenTemplate(
      headerImage: helpCreateNotesImage(
        imageHeight: 300,
        imageWidth: MediaQuery.of(context).size.width,
      ),
      helpTitle: 'Creating notes is easy!',
      helpDescription: [
        RichText(
          text: const TextSpan(
            style: FontTypography.mutedText3,
            children: [
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