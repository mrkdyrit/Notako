import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/view_note_edit.dart';
import 'package:notako_app/screens/notes/view_only_note.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class ViewNoteScreen extends StatefulWidget {
  final String noteLabel;
  final String noteContent;
  final bool isLocked;
  final List<String> noteTags;

  const ViewNoteScreen({
    super.key,
    required this.noteLabel,
    required this.noteContent,
    required this.isLocked,
    required this.noteTags,
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

  @override
  Widget build(BuildContext context) {
    if(isEditMode) {
      return ViewNoteEditScreen(
        noteLabel: widget.noteLabel, 
        noteContent: widget.noteContent, 
        noteTags: widget.noteTags,
        changeMode: enableEditMode,
      );
    } else {
      return ViewOnlyNoteScreen(
        noteLabel: widget.noteLabel, 
        noteContent: widget.noteContent, 
        noteTags: widget.noteTags,
        changeMode: enableEditMode,
      );
    }
  }
}