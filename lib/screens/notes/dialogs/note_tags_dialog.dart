import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

Widget noteTagsDialog({
  required BuildContext context,
  required Size size,
}) {
  return SizedBox.fromSize(
    size: size,
    child: InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return notakoAlertDialog(
                  titleText: 'Note Tags', titleIcon: Icons.sell,
                  context: context,
                  children: [
                    const Text(
                      'Add up to five tags to organize your note.',
                      style: FontTypography.mutedText3,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Add Tag...',
                          hintStyle: FontTypography.mutedText4,
                          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          prefixIcon: const Icon(Icons.sell)
                        ),
                      ),
                    ),
                  ]
                );
              }
            );
          },
        );
      },
      child: Column(
        children: const [
          Icon(
            Icons.sell, 
            color: Colors.black
          ),
          Text(
            'Note Tags',
            style: FontTypography.subHeading3,
          ),
        ],
      ),
    ),
  );
}