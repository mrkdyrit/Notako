import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
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
    return helpScreenTemplate(
      headerImage: helpNoteTagsImage(
        imageHeight: 300,
        imageWidth: MediaQuery.of(context).size.width,
      ),
      helpTitle: 'Organize with Note Tags.',
      helpDescription: [
        const Text(
          'Note Tags puts your notes into categories and lets you browse your notes by category.',
          style: FontTypography.mutedText3,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                'While in the note edit or note create screen: ',
                style: FontTypography.mutedText3.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              RichText(
                text: TextSpan(
                  style: FontTypography.mutedText3,
                  children: [
                    TextSpan(text: '${' ' * 3} 1. Click the '),
                    const TextSpan(
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
                    const TextSpan(
                      text: 'Options',
                      style: TextStyle(
                        color: notako_color.Colors.secondaryColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const TextSpan(text: ' button on the top-right corner.')
                  ]
                ),
              ),
              RichText(
                text: TextSpan(
                  style: FontTypography.mutedText3,
                  children: [
                    TextSpan(text: '${' ' * 3}2. Select '),
                    const TextSpan(
                      text: 'Note Tags',
                      style: TextStyle(
                        color: notako_color.Colors.secondaryColor,
                      )
                    ),
                    const TextSpan(text: '.')
                  ]
                ),
              ),
              RichText(
                text: TextSpan(
                  style: FontTypography.mutedText3,
                  children: [
                    TextSpan(
                      text: '${' ' * 3}3. Add your desired tags and click ',
                    ),
                    const TextSpan(
                      text: 'OK',
                      style: TextStyle(
                        color: notako_color.Colors.secondaryColor,
                      )
                    ),
                    const TextSpan(text: '.')
                  ]
                ),
              )
            ],
          ),
        )
      ]
    );
  }
}