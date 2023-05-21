import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/snackbar_util.dart';

Widget noteLockDialog({
  required BuildContext context,
  required GlobalKey<NavigatorState> createNoteScaffoldKey,
  required Function() lockNote,
}) {
  return SizedBox.fromSize(
    size: const Size(70,50),
    child: InkWell(
      onTap: () {
        lockNote.call();

        Navigator.of(context).pop();
        SnackBarUtil.showSnackBar(
          createNoteScaffoldKey.currentContext!, 
          'Note locked.'
        );
      },
      child: Column(
        children: const [
          Icon(
            Icons.lock, 
            color: Colors.black
          ),
          Text(
            'Password',
            style: FontTypography.subHeading3,
          ),
        ],
      ),
    ),
  );
}