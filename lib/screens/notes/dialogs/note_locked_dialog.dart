import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/snackbar_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget noteLockDialog({
  required BuildContext context,
  required GlobalKey<NavigatorState> createNoteScaffoldKey,
  required Function() lockNote,
}) {
  return SizedBox.fromSize(
    size: const Size(70,50),
    child: InkWell(
      onTap: () {
        SharedPreferences.getInstance().then((prefs) {
          if(prefs.getString('notePassword') != null || prefs.getString('notePassword')!.isNotEmpty) {
            lockNote.call();

            Navigator.of(context).pop();
            SnackBarUtil.showSnackBar(
              createNoteScaffoldKey.currentContext!, 
              'Note locked.'
            );
          } else {
            Navigator.of(context).pop();
            SnackBarUtil.showSnackBar(
              createNoteScaffoldKey.currentContext!, 
              'No Password is Set'
            );
          }
        });
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