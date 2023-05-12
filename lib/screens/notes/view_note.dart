import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:notako_app/screens/notes/view_note_edit.dart';
import 'package:notako_app/screens/notes/view_only_note.dart';
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:path_provider/path_provider.dart';

class ViewNoteScreen extends StatefulWidget {
  // final String noteLabel;
  // final String noteContent;
  // final bool isLocked;
  // final List<String> noteTags;
  final String noteId;

  const ViewNoteScreen({
    super.key,
    // required this.noteLabel,
    // required this.noteContent,
    // required this.isLocked,
    // required this.noteTags,
    required this.noteId,
  });

  @override
  State<ViewNoteScreen> createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  bool isEditMode = false;

  void enableEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  var imageAttachments = [];

  @override
  void initState() {
    super.initState();
    getImages();
  }

  void getImages() async {
    final appDir = await getApplicationDocumentsDirectory();

    Directory noteImages = Directory('${appDir.path}/${widget.noteId}/images');

    var images = noteImages.listSync().where((element) => element is File);

    for(var image in images) {
      imageAttachments.add(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: NotakoDBHelper().getNoteDetails(widget.noteId),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          Map<dynamic, dynamic> noteDetails = snapshot.data!.snapshot.value;

          if(isEditMode) {
            return ViewNoteEditScreen(  
              noteLabel: noteDetails['title'], 
              noteContent: noteDetails['content'],
              noteTags: noteDetails['tags'],
              noteId: widget.noteId,
              changeMode: enableEditMode,
            );
          } else {
            return ViewOnlyNoteScreen(
              noteLabel: noteDetails['title'], 
              noteContent: noteDetails['content'], 
              noteTags: noteDetails['tags'],
              changeMode: enableEditMode,
              images: imageAttachments,
            );
          }
        } else {
          return const Center(
            child: LoadingIndicator(
                indicatorType: Indicator.circleStrokeSpin,
                colors: [notako_color.Colors.secondaryColor],
                strokeWidth: 5,
            ),
          );
        }
      },
    );
  }
}