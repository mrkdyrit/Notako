import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/notes_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/screens/notes/note_card.dart';
import 'package:notako_app/screens/trash/restore_note_card.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  final searchFormKey = GlobalKey<FormState>();

  List<String> selection = [];
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              width: screenWidth > 500 ? screenWidth * 0.7 : screenWidth * 0.9,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 5,
                    cornerSmoothing: 1,
                  ),
                ),
                child: Form(
                  key: searchFormKey,
                  child: TextFormField(
                    focusNode: searchFocusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please type something.';
                      }
                      return null;
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search, color: notako_color.Colors.greyColor,),
                        onPressed: () {
                          // if(searchFormKey.currentState!.validate()) {

                          // }

                          searchFocusNode.unfocus();
                          searchController.clear();
                        },
                      ),
                      border: InputBorder.none,
                      hintText: 'Search Tags...',
                    ),
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Trash',
                style: NotakoTypography.heading.copyWith(
                  fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 8.0,
                  spacing: 5,
                  children: const [
                    RestoreNoteCard(
                      noteId: 'trash_1',
                      isLocked: true,
                      createdDate: 'Kahapon Lang',
                      noteContent: 'Medyo May Content',
                      noteLabel: 'Sample Trash',
                      noteTags: [],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )  
    );
  }
}