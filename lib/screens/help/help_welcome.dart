import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return helpScreenTemplate(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      headerImage: helpWelcomeImage(
        imageHeight: screenHeight > 700 ? screenHeight * 0.4: 300,
        imageWidth: screenWidth,
      ),
      helpTitle: 'Welcome to NotaKo!',
      helpDescription: [
        RichText(
          text: TextSpan(
            text: 'NotaKo is a simple notetaking app. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel auctor odio. ',
            style: NotakoTypography.mutedText.copyWith(
              fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
            )
          ),
        )
      ]
    );
  }
}