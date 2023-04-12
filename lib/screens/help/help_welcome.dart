import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/help/help_screen_template.dart';
import 'package:notako_app/widgets/help/images/help_welcome_image_builder.dart';

class HelpWelcomeScreen extends StatefulWidget {
  const HelpWelcomeScreen({super.key});

  @override
  State<HelpWelcomeScreen> createState() => HelpWelcomeScreenState();
}

class HelpWelcomeScreenState extends State<HelpWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return helpScreenTemplate(
      headerImage: helpWelcomeImage(
        imageHeight: 300,
        imageWidth: MediaQuery.of(context).size.width,
      ),
      helpTitle: 'Welcome to NotaKo!',
      helpDescription: [
        RichText(
          text: const TextSpan(
            text: 'NotaKo is a simple notetaking app. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel auctor odio. ',
            style: FontTypography.mutedText3,
          ),
        )
      ]
    );
  }
}