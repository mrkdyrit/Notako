import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class ViewNoteEditScreen extends StatefulWidget {
  final String noteLabel;
  final String noteContent;
  final List<String> noteTags;
  final Function() changeMode;

  const ViewNoteEditScreen({
    super.key,
    required this.noteLabel,
    required this.noteContent,
    required this.noteTags,
    required this.changeMode,
  });

  @override
  State<ViewNoteEditScreen> createState() => ViewNoteEditScreenState();
}

class ViewNoteEditScreenState extends State<ViewNoteEditScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Note',
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
            icon: const Icon(Icons.save)
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
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Note Title',
                    labelText: widget.noteLabel,
                    border: InputBorder.none,
                    hintStyle: NotakoTypography.mutedText.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                    ),
                    counterText: ''
                  ),
                  style: NotakoTypography.mutedText.copyWith(
                    fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5),
                  ),
                  maxLines: 1,
                  maxLength: 100,   
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      for(var tag in widget.noteTags) ...[
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
                        ),
                      ],
                    ],
                  ),
                ),
                TextField(
                  minLines: 12,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  // textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    hintText: widget.noteContent,
                    hintStyle: NotakoTypography.mutedText.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                    ),
                    hintMaxLines: 12
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Wrap(
                    spacing: 8.0, // spacing between columns
                    runSpacing: 4.0,
                    children: [
                      
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}