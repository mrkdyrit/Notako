import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notako_app/screens/notes/dialogs/image_attachments_dialog.dart';
import 'package:notako_app/screens/notes/dialogs/note_locked_dialog.dart';
import 'package:notako_app/screens/notes/dialogs/note_tags_dialog.dart';
import 'package:notako_app/screens/notes/view_note.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/snackbar_util.dart';
import 'package:notako_app/utils/v2/font_typography.dart';


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

  List<String> noteTags = [];

  List<XFile> imageAttachments = [];

  void addImageAttachment(List<XFile> pendingImages) {
    setState(() {
      imageAttachments.addAll(pendingImages);
    });
  }

  void addTag(List<String> tags) {
    setState(() {
      noteTags.addAll(tags);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
              String noteTitle = noteTitleController.text.isNotEmpty ? noteTitleController.text : 'Untitled Note';

              await NotakoDBHelper().createNote(noteTitle, noteContentController.text, noteTags, imageAttachments).then((noteId) {
                if(noteId != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => 
                      ViewNoteScreen(
                        noteId: noteId,
                      )
                    )
                  );
                }
              });

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
                          addTag: addTag,
                          tagList: noteTags,
                        ),
                        imageAttachmentDialog(
                          context: context, 
                          size: bottomSheetIconSize,
                          attachImage: addImageAttachment,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        for(var tag in noteTags) ...[
                          Container(
                            padding: const EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                            decoration: BoxDecoration(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 15,
                                cornerSmoothing: 1,
                              ),
                              color: Colors.blueAccent,
                            ),
                            child: Flex(
                              mainAxisSize: MainAxisSize.min,
                              direction: Axis.horizontal,
                              children: [
                                Flexible(
                                  child: Text(
                                    tag,
                                    style: NotakoTypography.bodyText.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, 8),
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )      
                        ]
                      ],
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Wrap(
                      spacing: 8.0, // spacing between columns
                      runSpacing: 8.0,
                      children: [
                        for(XFile image in imageAttachments) ...[
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 10,
                                cornerSmoothing: 1,
                              ),
                              child: Image.file(
                                fit: BoxFit.fill,
                                File(image.path),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}