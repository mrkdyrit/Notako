import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/data/notes_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/screens/notes/note_card.dart';
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';
import 'package:notako_app/widgets/notako_search_bar.dart';


class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController searchController = TextEditingController();
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
                        for(var id in selection) {
                          // NotakoDBHelper().deleteNote(id);
                          NotakoDBHelper().moveToTrash(id);
                        }

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
          child: StreamBuilder(
          stream: NotakoDBHelper().getNotes(),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data.snapshot.value != null) {
              Map<dynamic, dynamic> notesMap = snapshot.data!.snapshot.value;
              // List<dynamic> notesList = notesMap.values.toList();
              return ListView(
                children: [
                  NotakoSearchBar(
                    textEditingController: searchController,
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
                          for(var note in notesMap.entries) ...[
                            NoteCard(
                              selection: selection,
                              enableEditMode: enableSelectMode, 
                              noteId: note.key,
                              noteLabel: note.value['title'], 
                              noteContent: note.value['content'], 
                              noteTags: note.value['tags'] ?? [], 
                              editMode: enableMultiSelectMode, 
                              createdDate: note.value['date_created'],
                              isLocked: note.value['is_locked'],
                            ),                            
                          ]
                        ],
                      ),
                    ),
                  )
                ]
              );
            } else {
              return Center(
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: AssetImage(Assets.noNoteIndicator),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'No Notes',
                        style: NotakoTypography.heading.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs4)
                        ),
                      ),
                    ),
                    Text(
                      'Get started with a new note.',
                      style: NotakoTypography.mutedText.copyWith(
                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                      ),
                    ),
                  ],
                ),
              ); 
            }
          },
        ),
      ),
    );
  }
}