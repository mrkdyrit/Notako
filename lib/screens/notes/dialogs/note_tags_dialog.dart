import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Widget noteTagsDialog({
  required BuildContext context,
  required Size size,
  required Function(List<String>) addTag,
  required List<String> tagList,
}) {
  TextEditingController tagInputController = TextEditingController();

  return SizedBox.fromSize(
    size: size,
    child: InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                double screenWidth = MediaQuery.of(context).size.width;

                return notakoAlertDialog(
                  titleText: 'Note Tags', titleIcon: Icons.sell,
                  alertDescription: 'Add up to five tags to organize your note.',
                  context: context,
                  onSubmit: () {
                    if(tagInputController.text.isNotEmpty) {
                      addTag([tagInputController.text]);
                      tagInputController.clear();
                    }
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: NotakoTextFormField(
                        hintText: 'Add Tags...',
                        prefixIcon: Icons.sell,
                        textFieldController: tagInputController,
                        onFieldSubmitted: (value) {
                          if(tagInputController.text.isNotEmpty) {
                            addTag([tagInputController.text]);
                            tagInputController.clear();
                          }
                        },
                      ),
                    ),
                    Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      for(String tag in tagList) ...[
                        Container(
                          padding: const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 15,
                              cornerSmoothing: 1,
                            ),
                            color: Colors.blueAccent,
                          ),
                          child: SizedBox(
                            width: 50,
                            child: Flex(
                              mainAxisSize: MainAxisSize.min,
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Text(
                                    tag,
                                    style: NotakoTypography.bodyText.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, 10),
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    child: const Icon(Icons.close, color: notako_color.Colors.greyColor, size: 16,),
                                    onTap: () {
                                      setState(() {
                                        tagList.remove(tag);
                                      });
                                    },
                                  )
                                ),
                              ],
                            ),
                          )
                        )
                      ],
                    ]
                    ),
                  ]
                );
              }
            );
          },
        );
      },
      child: Column(
        children: const [
          Icon(
            Icons.sell, 
            color: Colors.black
          ),
          Text(
            'Note Tags',
            style: FontTypography.subHeading3,
          ),
        ],
      ),
    ),
  );
}