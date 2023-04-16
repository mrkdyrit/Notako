import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Widget helpScreenTemplate({
  required Widget headerImage,
  required String helpTitle,
  required List<Widget> helpDescription,
  required double screenWidth,
  required double screenHeight,
}) {
  return Scaffold(
    body: ListView(
      children: [
        headerImage,
        Center (
          child: SizedBox(
            width: screenWidth > 1200 ? 1000 : screenWidth * 0.9,
            child: Align(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: (screenWidth * 0.05),),
                    child: Text(
                      helpTitle,
                      style: NotakoTypography.heading.copyWith(
                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs1),
                        color: notako_color.Colors.secondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Wrap(
                      children: helpDescription,
                    ),
                  )
                ],
              ),
            )
          ),
        )
      ],
    ),
  );
}