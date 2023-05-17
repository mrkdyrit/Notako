import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/note_tags_data.dart';
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/notako_search_bar.dart';

class NoteTagsHome extends StatefulWidget {
  final Function(String) searchTag;
  final Map tagList;

  const NoteTagsHome({
    super.key, 
    required this.searchTag,
    required this.tagList,
  });

  @override
  State<NoteTagsHome> createState() => _NoteTagsHomeState();
}

class _NoteTagsHomeState extends State<NoteTagsHome> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Get all tags
    List noteTagData = NoteTagsData().getNoteTagsData();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: NotakoDBHelper().getNotes(),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data.snapshot.value != null) {
              Map<dynamic, dynamic> notesMap = snapshot.data!.snapshot.value;

              return ListView(
                children: [
                  NotakoSearchBar(
                    textEditingController: searchController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Note Tags',
                      style: NotakoTypography.heading.copyWith(
                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: screenWidth > 500 ? screenWidth * 0.6 : screenWidth * 0.8,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          for(var tag in widget.tagList.entries) ...[
                            InkWell(
                              onTap: () {
                                widget.searchTag(tag.key);
                              },
                              child: SizedBox(
                                // height: 36,
                                width: 140,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 5,
                                      cornerSmoothing: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          tag.key,
                                          style: NotakoTypography.subHeading.copyWith(
                                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                                            overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          textAlign: TextAlign.end,
                                          tag.value.toString(),
                                          style: NotakoTypography.subHeading.copyWith(
                                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                                            overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: Text('No Tags Yet'));
            }
          },
        ),
      ),
    );
  }
}