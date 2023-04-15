import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/help/help_screen_template.dart';
import 'package:notako_app/widgets/help/images/help_lock_notes_image_builder.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class HelpLockNotesScreen extends StatefulWidget {
  const HelpLockNotesScreen({super.key});

  @override
  State<HelpLockNotesScreen> createState() => _HelpLockNotesScreenState();
}

class _HelpLockNotesScreenState extends State<HelpLockNotesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: helpScreenTemplate(
        screenWidth: screenWidth, 
        screenHeight: screenHeight,
        headerImage: helpLockNotesImage(
          imageHeight: screenHeight > 700 ? screenHeight * 0.4: 300,
          imageWidth: screenWidth,
        ), 
        helpTitle: 'Secure your notes.', 
        helpDescription: [
          Text(
            'Protect your notes with a password or PIN. One password applies to all notes you lock in the future.',
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
                  'Set-up your password on the main menu: ',
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
                            const TextSpan(text: '1. Open the '),
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.menu, 
                                    size: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6), 
                                    color: notako_color.Colors.secondaryColor,
                                  ),
                                ),
                              ]
                            ),
                            const TextSpan(
                              text: ' Drawer',
                              style: TextStyle(
                                color: notako_color.Colors.secondaryColor,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            const TextSpan(text: '.')
                          ]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: NotakoTypography.mutedText.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                          ),
                          children: [
                            const TextSpan(text: '2. Select '),
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.settings, 
                                    size: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6), 
                                    color: notako_color.Colors.secondaryColor,
                                  ),
                                ),
                              ]
                            ),
                            const TextSpan(
                              text: ' Settings',
                              style: TextStyle(
                                color: notako_color.Colors.secondaryColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const TextSpan(text: ' -> '),
                            const TextSpan(
                              text: ' Note Password',
                              style: TextStyle(
                                color: notako_color.Colors.secondaryColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const TextSpan(text: '.')
                          ],
                        ),
                      ),
                      Text(
                        '3. Set the password you want to use.',
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  'While in the note edit or note create screen:  ',
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
                              text: 'Note Password',
                              style: TextStyle(
                                color: notako_color.Colors.secondaryColor,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            TextSpan(text: ' to lock or unlock the note.')
                          ]
                        ),
                      ),
                    ]
                  ),
                )
              ],
            ),
          )
        ], 
      ),
    );
  }
}