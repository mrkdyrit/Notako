import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/note_tags_data.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

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
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final searchFormKey = GlobalKey<FormState>();

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