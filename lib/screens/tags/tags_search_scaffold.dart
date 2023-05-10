import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/note_tags_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/notako_search_bar.dart';

class NoteTagSearch extends StatefulWidget {
  final Function(String) goBack;
  final String tagId;

  const NoteTagSearch({
    super.key,
    required this.goBack,
    required this.tagId,
  });

  @override
  State<NoteTagSearch> createState() => NoteTagSearchState();
}

class NoteTagSearchState extends State<NoteTagSearch> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Map<String, dynamic> noteTagDetails = NoteTagsData().getNoteTagsData().where((tag) => tag['id'] == widget.tagId).first;

    return WillPopScope(
      onWillPop: () async {
        widget.goBack('');
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
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
                  '"${noteTagDetails["tag_name"]}" Notes',
                  style: NotakoTypography.heading.copyWith(
                    fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Wrap(
                  runSpacing: 10,
                  spacing: screenWidth > 500 ? 70 : screenWidth * 0.05,
                  children: const [

                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}