import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/view_note.dart';
import 'package:notako_app/utils/db/notako_db_helper.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

class RestoreNoteCard extends StatefulWidget {
  final String noteLabel;
  final String noteContent;
  final String noteId;
  final List<dynamic> noteTags;
  final String createdDate;
  final bool isLocked;

  const RestoreNoteCard({
    super.key,
    required this.noteLabel,
    required this.noteId,
    required this.noteContent,
    required this.noteTags,
    required this.createdDate,
    required this.isLocked,
  });

  @override
  State<RestoreNoteCard> createState() => _RestoreNoteCardState();
}

class _RestoreNoteCardState extends State<RestoreNoteCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return notakoAlertDialog(
              titleText: 'Restore Note', 
              titleIcon: Icons.restore,
              alertDescription: 'Are you sure you want to restore this note?',
              context: context,
              children: [],
              onSubmit: () {
                NotakoDBHelper().restoreTrash(widget.noteId);
              }
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 175,
        decoration: BoxDecoration(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 15,
            cornerSmoothing: 1,
          ),
          color: Colors.white,
          border: Border.all(color: Colors.white)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    child: Text(
                      widget.noteLabel,
                      style: NotakoTypography.subHeading.copyWith(
                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                        fontWeight: FontWeight.bold,
                        overflow:TextOverflow.ellipsis
                      ),
                    ),
                  ),
                  if(widget.isLocked) ...[
                    const Flexible(
                      child: Icon(
                        Icons.lock, 
                        color: notako_color.Colors.primaryColor,
                        size: NotakoTypography.fs6,
                      )
                    )
                  ]
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10.0),
              child: Text(
                widget.isLocked ? 'This note is locked.' : widget.noteContent,
                maxLines: 3,
                style: NotakoTypography.bodyText.copyWith(
                  fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                ),
              )
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  if(widget.noteTags.isNotEmpty && !widget.isLocked) ...[
                    for(var tag in widget.noteTags) ...[
                      Container(
                        padding: const EdgeInsets.all(6.0),
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
                        )
                      ),
                    ]
                  ]
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.createdDate,
                  style: NotakoTypography.mutedText.copyWith(
                    fontSize: NotakoTypography.calculateFontSize(screenWidth, 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}