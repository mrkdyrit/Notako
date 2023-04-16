import 'package:flutter/material.dart';
import 'package:notako_app/utils/color_config.dart';

class NotakoTypography {
  NotakoTypography._();

  static const double defaultFontSize = 16;

  static const double fs1 = defaultFontSize * 2.25;
  static const double fs2 = defaultFontSize * 2;
  static const double fs3 = defaultFontSize * 1.75;
  static const double fs4 = defaultFontSize * 1.5;
  static const double fs5 = defaultFontSize * 1.25;
  static const double fs6 = defaultFontSize * 0.9;

  static double calculateFontSize(double screenWidth, double initialFontSize) {
    double calculatedFontSize = 0;

    /** Breakpoints */

    // Small Screens
    if(screenWidth >= 1400) {
      calculatedFontSize = initialFontSize * 2;
    }

    if(screenWidth >= 1200) {
      calculatedFontSize = initialFontSize * 1.75;
    }
    

    if(screenWidth >= 992) {
      calculatedFontSize = initialFontSize * 1.5;
    }

    if(screenWidth >= 768) {
      calculatedFontSize = initialFontSize * 1.25;
    }

    if(screenWidth <= 576) {
      calculatedFontSize = initialFontSize * 1;
    }

    return calculatedFontSize;
  }

  static const TextStyle heading = TextStyle(fontWeight: FontWeight.bold, color: ColorConfig.headingColor,);
  static const TextStyle subHeading = TextStyle(fontWeight: FontWeight.w500, color: ColorConfig.headingColor,);
  static const TextStyle bodyText = TextStyle(fontWeight: FontWeight.normal,);
  static const TextStyle mutedText = TextStyle(color: ColorConfig.mutedColor);
}