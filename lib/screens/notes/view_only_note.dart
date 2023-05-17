import 'dart:io';
import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class ViewOnlyNoteScreen extends StatefulWidget {
  final String noteLabel;
  final String noteContent;
  final List<dynamic>? noteTags;
  final Function() changeMode;
  final List<dynamic> images;

  const ViewOnlyNoteScreen({
    super.key,
    required this.noteLabel,
    required this.noteContent,
    required this.noteTags,
    required this.changeMode,
    required this.images,
  });

  @override
  State<ViewOnlyNoteScreen> createState() => _ViewOnlyNoteScreenState();
}

class _ViewOnlyNoteScreenState extends State<ViewOnlyNoteScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Note',
          style: NotakoTypography.heading.copyWith(
            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: notako_color.Colors.secondaryColor),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              widget.changeMode();
            }, 
            icon: const Icon(Icons.edit)
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    widget.noteLabel,
                    style: NotakoTypography.subHeading.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      if(widget.noteTags != null) ...[
                        if(widget.noteTags!.isNotEmpty) ...[
                          for(var tag in widget.noteTags!) ...[
                            if(tag != null) ...[
                              Container(
                                padding: const EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: 15,
                                    cornerSmoothing: 1,
                                  ),
                                  color: Colors.blueAccent,
                                ),
                                child: Flex(
                                  mainAxisSize: MainAxisSize.min,
                                  direction: Axis.horizontal,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        tag,
                                        style: NotakoTypography.bodyText.copyWith(
                                          fontSize: NotakoTypography.calculateFontSize(screenWidth, 8),
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ],
                        ]
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    widget.noteContent,
                    style: NotakoTypography.mutedText.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Wrap(
                      spacing: 8.0, // spacing between columns
                      runSpacing: 4.0,
                      children: [
                        if(widget.images.isNotEmpty) ...[
                          for(File image in widget.images) ...[
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: SmoothBorderRadius(
                                  cornerRadius: 10,
                                  cornerSmoothing: 1,
                                ),
                                child: Image.file(
                                  fit: BoxFit.fill,
                                  File(image.path),
                                ),
                              ),
                            ),
                          ]
                        ]
                      ],
                    ),
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