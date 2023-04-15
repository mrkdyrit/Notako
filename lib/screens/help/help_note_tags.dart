import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/help/help_screen_template.dart';
import 'package:notako_app/widgets/help/images/help_note_tags_image_builder.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class HelpNoteTagsScreen extends StatefulWidget {
  const HelpNoteTagsScreen({super.key});

  @override
  State<HelpNoteTagsScreen> createState() => _HelpNoteTagsScreenState();
}

class _HelpNoteTagsScreenState extends State<HelpNoteTagsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return helpScreenTemplate(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: screenWidth,
      headerImage: helpNoteTagsImage(
        imageHeight: screenHeight > 700 ? screenHeight * 0.4: 300,
        imageWidth: MediaQuery.of(context).size.width,
      ),
      helpTitle: 'Organize with Note Tags.',
      helpDescription: [
        Text(
          'Note Tags puts your notes into categories and lets you browse your notes by category.',
          style: NotakoTypography.mutedText.copyWith(
            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                'While in the note edit or note create screen: ',
                style: NotakoTypography.mutedText.copyWith(
                  fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                        ),
                        children: const [
                          TextSpan(text: '1. Click the '),
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.more_horiz, 
                                  size: 16, 
                                  color: notako_color.Colors.secondaryColor,
                                ),
                              ),
                            ]
                          ),
                          TextSpan(
                            text: 'Options',
                            style: TextStyle(
                              color: notako_color.Colors.secondaryColor,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          TextSpan(text: ' button on the top-right corner.')
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                        ),
                        children: const [
                          TextSpan(text: '2. Select '),
                          TextSpan(
                            text: 'Note Tags',
                            style: TextStyle(
                              color: notako_color.Colors.secondaryColor,
                            )
                          ),
                          TextSpan(text: '.')
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                        ),
                        children: const [
                          TextSpan(
                            text: '3. Add your desired tags and click ',
                          ),
                          TextSpan(
                            text: 'OK',
                            style: TextStyle(
                              color: notako_color.Colors.secondaryColor,
                            )
                          ),
                          TextSpan(text: '.')
                        ]
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]
    );
  }
}