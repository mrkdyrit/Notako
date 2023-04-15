import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return helpScreenTemplate(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: screenWidth,
      headerImage: helpImageAttachmentImage(
        imageHeight: screenHeight > 700 ? screenHeight * 0.4: 300,
        imageWidth: screenWidth,
      ),
      helpTitle: 'Add images to your notes.',
      helpDescription: [
        Text(
          'NotaKo also supports image attachments! This allows you to  add related images from your gallery to your notes.',
          style: NotakoTypography.mutedText.copyWith(
              fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
            ),
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                'While in the note edit or note create screen: ',
                style: NotakoTypography.mutedText.copyWith(
                  fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                  fontWeight: FontWeight.bold,
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                        ),
                        children: [
                          const TextSpan(text: '1. Click the '),
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.more_horiz, 
                                  size: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6), 
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
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                        ),
                        children: const [
                          TextSpan(text: '2. Select '),
                          TextSpan(
                            text: 'Images',
                            style: TextStyle(
                              color: notako_color.Colors.secondaryColor,
                            )
                          ),
                          TextSpan(text: '.')
                        ]
                      ),
                    ),
                    Text(
                      '3. Import desired images from your Gallery.',
                      style: NotakoTypography.mutedText.copyWith(
                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                        ),
                        children: const [
                          TextSpan(
                            text: '4. Confirm your attachments and click ',
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
      ],
    );
  }
}