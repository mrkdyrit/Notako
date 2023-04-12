import 'package:flutter/material.dart';
import 'package:notako_app/utils/color_config.dart';

class FontTypography {
  // Font Family
  static const fontFamily = 'DM-Sans';

  // Font Size
  static const double fs1 = 24.0;
  static const double fs2 = 20.0;
  static const double fs3 = 16.0;
  static const double fs4 = 14.0;
  static const double fs5 = 12.0;
  static const double fs6 = 10.0;
  static const double fs7 = 8.0;
  static const double fs8 = 6.0;

  // Text Styles

  // Headings
  static const TextStyle heading1 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs1, color: ColorConfig.headingColor,);
  static const TextStyle heading2 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs2, color: ColorConfig.headingColor,);
  static const TextStyle heading3 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs3, color: ColorConfig.headingColor,);
  static const TextStyle heading4 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs4, color: ColorConfig.headingColor,);
  static const TextStyle heading5 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs5, color: ColorConfig.headingColor,);

  // Sub-headings
  static const TextStyle subHeading1 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs2, color: ColorConfig.headingColor,);
  static const TextStyle subHeading2 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs3, color: ColorConfig.headingColor,);
  static const TextStyle subHeading3 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs4, color: ColorConfig.headingColor,);

  // Regular Text
  static const TextStyle regularText1 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.normal, fontSize: fs4,);
  static const TextStyle regularText2 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.normal, fontSize: fs5,);
  static const TextStyle regularText3 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.normal, fontSize: fs6,);
  static const TextStyle regularText4 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.normal, fontSize: fs7,);
  
  // Muted Texts

  static const TextStyle mutedText1 = TextStyle(
    fontFamily: fontFamily, 
    fontWeight: FontWeight.normal, 
    fontSize: fs2, 
    color: ColorConfig.mutedColor
  );

  static const TextStyle mutedText2 = TextStyle(
    fontFamily: fontFamily, 
    fontWeight: FontWeight.normal, 
    fontSize: fs4, 
    color: ColorConfig.mutedColor
  );

  static const TextStyle mutedText3 = TextStyle(
    fontFamily: fontFamily, 
    fontWeight: FontWeight.normal, 
    fontSize: fs5, 
    color: ColorConfig.mutedColor
  );

  static const TextStyle mutedText4 = TextStyle(
    fontFamily: fontFamily, 
    fontWeight: FontWeight.normal, 
    fontSize: fs6, 
    color: ColorConfig.mutedColor
  );

  static const TextStyle mutedText5 = TextStyle(
    fontFamily: fontFamily, 
    fontWeight: FontWeight.normal, 
    fontSize: fs7, 
    color: ColorConfig.mutedColor
  );

  static const TextStyle mutedText6 = TextStyle(
    fontFamily: fontFamily, 
    fontWeight: FontWeight.normal, 
    fontSize: fs8, 
    color: ColorConfig.mutedColor
  );
}