import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/color_config.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

AlertDialog notakoAlertDialog({
  required String titleText,
  required String alertDescription,
  required IconData? titleIcon,
  required BuildContext context,
  required List<Widget> children,
  Function? onSubmit,
  Function? onCancel,
  bool autoClose = true,
}) {
  return AlertDialog(
    contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
    titlePadding: const EdgeInsets.only(bottom: 15.0, top:  15.0),
    shape: RoundedRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: 15,
        cornerSmoothing: 1,
      ),
    ),
    title: Center(
      child: Column(
        children: [
          Icon(
            titleIcon,
            color: ColorConfig.iconColor,
            size: 40,
          ),
          Text(
            titleText,
            style: FontTypography.subHeading2,
          ),
        ],
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            alertDescription,
            style: FontTypography.mutedText3,
            textAlign: TextAlign.center,
          ),
        ),
        ...children
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          onCancel?.call();
        }, 
        child: Text(
          'Cancel',
          style: FontTypography.regularText2.copyWith(
            color: notako_color.Colors.secondaryColor
          ),
        )
      ),
      TextButton(
        onPressed: () {
          if(autoClose) {
            Navigator.of(context).pop();
          }
          
          onSubmit?.call();
        }, 
        child: Text(
          'Ok',
          style: FontTypography.regularText2.copyWith(
            color: notako_color.Colors.secondaryColor
          ),
        )
      ),
    ],
  );
}