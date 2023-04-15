import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class SnackBarUtil {
  static void showSnackBar(BuildContext context, String message, {bool enableRootNavigator = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: NotakoTypography.bodyText.copyWith(
            fontSize: NotakoTypography.calculateFontSize(MediaQuery.of(context).size.width, NotakoTypography.fs6),
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 2),
        elevation: 5.0,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'OK',
          textColor: notako_color.Colors.secondaryColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}