import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/widgets/help/help_screen_template.dart';
import 'package:notako_app/widgets/help/images/help_image_attachments_image_builder.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class HelpImageAttachmentsScreen extends StatefulWidget {
  const HelpImageAttachmentsScreen({super.key});

  @override
  State<HelpImageAttachmentsScreen> createState() => _HelpImageAttachmentsScreenState();
}

class _HelpImageAttachmentsScreenState extends State<HelpImageAttachmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return helpScreenTemplate(
      headerImage: helpImageAttachmentImage(
        imageHeight: 300,
        imageWidth: MediaQuery.of(context).size.width,
      ),
      helpTitle: 'Add images to your notes.',
      helpDescription: [
        const Text(
          'NotaKo also supports image attachments! This allows you to  add related images from your gallery to your notes.',
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
                      text: 'Images',
                      style: TextStyle(
                        color: notako_color.Colors.secondaryColor,
                      )
                    ),
                    const TextSpan(text: '.')
                  ]
                ),
              ),
              Text(
                '${' ' * 3}3. Import desired images from your Gallery.',
                style: FontTypography.mutedText3,
              ),
              RichText(
                text: TextSpan(
                  style: FontTypography.mutedText3,
                  children: [
                    TextSpan(
                      text: '${' ' * 3}4. Confirm your attachments and click ',
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
      ],
    );
  }
}