import 'package:flutter/material.dart';
import 'package:notako_app/utils/color_config.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

AlertDialog notakoAlertDialog({
  required String titleText,
  required IconData titleIcon,
  required BuildContext context,
  required List<Widget> children,
  Function? onSubmit,
  Function? onCancel,
}) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
      children: children,
    ),
    actions: [
      TextButton(
        onPressed: () {
          onCancel?.call();
          Navigator.of(context).pop();
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
          onSubmit?.call();
          Navigator.of(context).pop();
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