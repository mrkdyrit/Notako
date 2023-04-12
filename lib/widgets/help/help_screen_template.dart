import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Widget helpScreenTemplate({
  required Widget headerImage,
  required String helpTitle,
  required List<Widget> helpDescription,
}) {
  return Scaffold(
    body: ListView(
      children: [
        headerImage,
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Text(
            helpTitle,
            style: FontTypography.heading1.copyWith(color: notako_color.Colors.secondaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Wrap(
            children: helpDescription,
          ),
        )
      ],
    ),
  );
}