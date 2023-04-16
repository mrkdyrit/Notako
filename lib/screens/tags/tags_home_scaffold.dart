import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Scaffold tagsHomeScaffold({
  required double screenWidth,
  required Function(String) changeMode,
}) {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final searchFormKey = GlobalKey<FormState>();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              runSpacing: 10,
              spacing: screenWidth > 500 ? 70 : screenWidth * 0.05,
              children: [
                InkWell(
                  onTap: () {
                    changeMode('Work');
                  },
                  child: SizedBox(
                    // height: 36,
                    width: 150,
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
                              'Work',
                              style: NotakoTypography.subHeading.copyWith(
                                fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '4',
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
                ),
                InkWell(
                  onTap: () {
                    changeMode('School');
                  },
                  child: SizedBox(
                    // height: 36,
                    width: 150,
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
                              'School',
                              style: NotakoTypography.subHeading.copyWith(
                                fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '2',
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
                ),
                InkWell(
                  onTap: () {
                    changeMode('Food');
                  },
                  child: SizedBox(
                    // height: 36,
                    width: 150,
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
                              'Food',
                              style: NotakoTypography.subHeading.copyWith(
                                fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '12',
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
                ),
              ],
            )
          )
        ],
      ),
    ),
  );
}