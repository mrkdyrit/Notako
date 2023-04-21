import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/data/note_tags_data.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class NoteTagsHome extends StatefulWidget {
  final Function(String) searchTag;

  const NoteTagsHome({
    super.key, required this.searchTag
  });

  @override
  State<NoteTagsHome> createState() => _NoteTagsHomeState();
}

class _NoteTagsHomeState extends State<NoteTagsHome> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final searchFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Get all tags
    List noteTagData = NoteTagsData().getNoteTagsData();

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
                    for(var tag in noteTagData) ...[
                      InkWell(
                        onTap: () {
                          widget.searchTag(tag['id']);
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
                                    tag['tag_name'],
                                    style: NotakoTypography.subHeading.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    tag['note_count'].toString(),
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
        ),
      ),
    );
  }
}