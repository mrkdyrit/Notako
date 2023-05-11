import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/data/notes_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/screens/notes/note_card.dart';
import 'package:notako_app/screens/trash/restore_note_card.dart';
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';
import 'package:notako_app/widgets/notako_search_bar.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  final searchController = TextEditingController();

  List<String> selection = [];
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: NotakoDBHelper().getTrashNotes(),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data.snapshot.value != null) {
              Map<dynamic, dynamic> trashNotes = snapshot.data!.snapshot.value;
              return ListView(
                children: [
                  NotakoSearchBar(
                    textEditingController: searchController,
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
                        children: [
                          for(var note in trashNotes.entries) ...[
                            RestoreNoteCard(
                              noteId: note.key,
                              isLocked: note.value['is_locked'],
                              createdDate: note.value['date_created'],
                              noteContent: note.value['content'],
                              noteLabel: note.value['title'],
                              noteTags: note.value['tags'] ?? [],
                            ),
                          ]
                        ],
                      ),
                    ),
                  )
                ],
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
                        'Trash is empty',
                        style: NotakoTypography.heading.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs4)
                        ),
                      ),
                    ),
                    Text(
                      'Looks like you haven\'t deleted any notes yet.',
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
      )  
    );
  }
}