import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/help/images/help_create_notes_image_builder.dart';

class HelpCreateNotesScreen extends StatefulWidget {
  const HelpCreateNotesScreen({super.key});

  @override
  State<HelpCreateNotesScreen> createState() => HelpCreateNotesScreenState();
}

class HelpCreateNotesScreenState extends State<HelpCreateNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: constraints.minHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  helpCreateNotesImage(
                    imageHeight: 300,
                    imageWidth: 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Text(
                      'Welcome to NotaKo!',
                      style: FontTypography.heading1.copyWith(color: notako_color.Colors.secondaryColor),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Text(
                      'NotaKo is a simple notetaking app. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel auctor odio. ',
                      style: FontTypography.mutedText3,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );  
  }
}