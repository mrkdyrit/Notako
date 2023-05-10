import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/notes_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/screens/notes/note_card.dart';
import 'package:notako_app/screens/trash/restore_note_card.dart';
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
        child: ListView(
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