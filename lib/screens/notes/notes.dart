import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/notes_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/screens/notes/note_card.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';


class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  final searchFormKey = GlobalKey<FormState>();

  bool enableMultiSelectMode = false;

  void enableSelectMode() {
    setState(() {
      enableMultiSelectMode = !enableMultiSelectMode;
    });
  }

  List<String> selection = [];
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> notes = NotesData().getNotes();
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(enableMultiSelectMode) {
            if(selection.isNotEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return notakoAlertDialog(
                    titleText: 'Confirm Delete', 
                    titleIcon: Icons.delete,
                    alertDescription: 'Are you sure you want to delete ${selection.length} notes?',
                    context: context,
                    children: [],
                    onSubmit: () {
                      setState(() {
                        selection.clear();
                        enableMultiSelectMode = false;
                      });
                    }
                  );
                },
              );
            } else {
              setState(() {
                enableMultiSelectMode = false;
              });
            }
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
            );
          }
        },
        child: enableMultiSelectMode ? const Icon(Icons.delete) : const Icon(Icons.add),
      ),
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
                'My Notes',
                style: NotakoTypography.heading.copyWith(
                  fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                ),
              ),
            ),
            Center(
              child: SizedBox(
                // width: screenWidth,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 8.0,
                  spacing: 5,
                  children: [
                    if(notes.isNotEmpty) ...[
                      for(var note in notes) ...[
                        NoteCard(
                          selection: selection,
                          enableEditMode: enableSelectMode, 
                          noteId: note['id'],
                          noteLabel: note['title'], 
                          noteContent: note['content'], 
                          noteTags: note['tags'], 
                          editMode: enableMultiSelectMode, 
                          createdDate: note['date_created'],
                          isLocked: note['is_locked'],
                        ),
                      ]
                    ]
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