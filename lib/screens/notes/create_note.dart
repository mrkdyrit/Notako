import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/dialogs/image_attachments_dialog.dart';
import 'package:notako_app/screens/notes/dialogs/note_locked_dialog.dart';
import 'package:notako_app/screens/notes/dialogs/note_tags_dialog.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';


class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final GlobalKey<NavigatorState> createNoteScaffoldKey = GlobalKey();

  final Size bottomSheetIconSize = const Size(70,50);

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
            onPressed: () {
              
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Note Title',
                  border: InputBorder.none,
                  hintStyle: FontTypography.mutedText1,
                  counterText: ''
                ),
                style: FontTypography.subHeading1,
                maxLines: 1,
                maxLength: 100,
              ),
              const TextField(
                minLines: 12,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                // textAlign: TextAlign.left,
                decoration: InputDecoration(
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
                ],
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}