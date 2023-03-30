import 'package:flutter/material.dart';

class FontTypography {
  // Font Family
  static const fontFamily = 'DM-Sans';

  // Font Size
  static const double fs1 = 24.0;
  static const double fs2 = 20.0;
  static const double fs3 = 16.0;
  static const double fs5 = 12.0;
  static const double fs4 = 14.0;
  static const double fs6 = 10.0;
  static const double fs7 = 8.0;
  static const double fs8 = 6.0;

  // Text Styles

  // Headings
  static const TextStyle heading1 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs1,);
  static const TextStyle heading2 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs2,);
  static const TextStyle heading3 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs3,);
  static const TextStyle heading4 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: fs4,);

  // Sub-headings
  static const TextStyle subHeading1 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs2,);
  static const TextStyle subHeading2 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs3,);
  static const TextStyle subHeading3 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs4,);
  static const TextStyle subHeading4 = TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: fs5,);

}