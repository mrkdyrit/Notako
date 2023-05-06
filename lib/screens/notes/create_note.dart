import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/dialogs/image_attachments_dialog.dart';
import 'package:notako_app/screens/notes/dialogs/note_locked_dialog.dart';
import 'package:notako_app/screens/notes/dialogs/note_tags_dialog.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/snackbar_util.dart';


class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final GlobalKey<NavigatorState> createNoteScaffoldKey = GlobalKey();

  final Size bottomSheetIconSize = const Size(70,50);

  final noteTitleController = TextEditingController();
  final noteContentController = TextEditingController();

  final noteTitleFocusNode = FocusNode();
  final noteContentFocusNode = FocusNode();

  final _createNoteForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: createNoteScaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Create Note',
          style: FontTypography.heading2,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: notako_color.Colors.secondaryColor),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              if(_createNoteForm.currentState!.validate()) {
                await NotakoDBHelper().createNote(noteTitleController.text, noteContentController.text, ["noteTags"]).then((value) {
                  SnackBarUtil.showSnackBar(context, value ? 'Note Saved.' : 'Failed to save note.');
                  if(value) {
                    noteTitleController.text = '';
                    noteContentController.text = '';
                  }
                });
              }

              noteContentFocusNode.unfocus();
              noteTitleFocusNode.unfocus();
            }, 
            icon: const Icon(Icons.save)
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical( 
                    top: Radius.circular(25.0),
                  ),
                ),
                context: context, 
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        noteTagsDialog(
                          context: context,
                          size: bottomSheetIconSize,
                        ),
                        imageAttachmentDialog(
                          context: context, 
                          size: bottomSheetIconSize,
                        ),
                        noteLockDialog(
                          context: context, 
                          createNoteScaffoldKey: createNoteScaffoldKey
                        ),
                      ],
                    ),
                  );
                }
              );
            }, 
            icon: const Icon(Icons.more_horiz)
          ),
        ],
      ),
      body: Form(
        key: _createNoteForm,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: noteTitleFocusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a note title.';
                      }

                      return null;
                    },
                    controller: noteTitleController,
                    decoration: const InputDecoration(
                      hintText: 'Note Title',
                      border: InputBorder.none,
                      hintStyle: FontTypography.mutedText1,
                      counterText: ''
                    ),
                    style: FontTypography.subHeading1,
                    maxLines: 1,
                    maxLength: 100,
                  ),
                  TextFormField(
                    focusNode: noteContentFocusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter content';
                      }

                      return null;
                    },
                    controller: noteContentController,
                    minLines: 12,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    // textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      // border: InputBorder.none,
                      hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet purus vitae lectus viverra dignissim ac mattis ligula. Ut ut magna quis ipsum facilisis hendrerit. Vivamus vitae commodo tellus, sit amet maximus sem. Aenean iaculis nibh eu tincidunt viverra. Donec ultrices vehicula lectus, non consectetur tellus volutpat non. Phasellus pellentesque dignissim leo ut rhoncus. Integer mattis urna non eros sagittis, id lobortis libero ultrices. Maecenas in leo iaculis, placerat elit vel, blandit diam. Curabitur consequat semper ligula, et posuere odio suscipit a. Nullam vehicula odio tellus, a eleifend ipsum posuere a. Morbi id lacus orci.',
                      hintStyle: FontTypography.mutedText3,
                      hintMaxLines: 12
                    ),
                  ),
                  Wrap(
                    spacing: 8.0, // spacing between columns
                    runSpacing: 4.0,
                    children: [
                      // Space for images
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}