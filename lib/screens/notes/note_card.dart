import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/view_note.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

class NoteCard extends StatefulWidget {
  final Function() enableEditMode;
  final String noteLabel;
  final String noteContent;
  final String noteId;
  final List<dynamic> noteTags;
  final bool editMode;
  final String createdDate;
  final List<String> selection;
  final bool isLocked;

  const NoteCard({
    super.key,
    required this.enableEditMode,
    required this.noteId,
    required this.noteLabel,
    required this.noteContent,
    required this.noteTags,
    required this.editMode,
    required this.createdDate,
    required this.selection,
    required this.isLocked,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool isSelected = false;

  final GlobalKey<NavigatorState> noteCardKey = GlobalKey();

  bool _isHidden = true;
  final Icon _passIconShow = const Icon(Icons.visibility, color: notako_color.Colors.greyColor,);
  final Icon _passIconHide = const Icon(Icons.visibility_off, color: notako_color.Colors.greyColor,);

  final passwordController = TextEditingController();

  void askPassword(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return notakoAlertDialog(
              titleText: 'Confirm Password', 
              alertDescription: 'Enter your password to view note.',
              titleIcon: Icons.lock, 
              context: context, 
              onCancel: () {
                passwordController.clear();
              },
              onSubmit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => 
                    ViewNoteScreen(
                      noteLabel: widget.noteLabel,
                      noteContent: widget.noteContent,
                      isLocked: widget.isLocked,
                      noteTags: [...widget.noteTags],
                    )
                  )
                );
                passwordController.clear();
              },
              children: [
                Form(
                  // key: passwordFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty || !RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,}$').hasMatch(value)) {
                            return '• Passwords must be alphanumeric. \n• Passwords must be 8 characters long. \n• Password must contain at least one uppercase letter.';
                          }

                          return null;
                        },
                        controller: passwordController,
                        onTapOutside: (event) {
                          setState(() {
                            _isHidden = true;
                          });
                        },
                        obscureText: _isHidden,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock, color: notako_color.Colors.greyColor,),
                          suffixIcon: IconButton(
                            icon: _isHidden ? _passIconShow: _passIconHide, 
                            onPressed: () { 
                              setState(() {
                                _isHidden ? _isHidden = false: _isHidden = true;
                              });
                            },
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            );
          }
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if(widget.editMode == false) {
      setState(() {
        isSelected = false;
      });
    }

    return InkWell(
      key: noteCardKey,
      onTap: () {
        if(!widget.editMode) {
          if(widget.isLocked) {
            askPassword(context);
          } else {
            Navigator.of(noteCardKey.currentContext!).push(
              MaterialPageRoute(builder: (context) => 
                ViewNoteScreen(
                  noteLabel: widget.noteLabel,
                  noteContent: widget.noteContent,
                  isLocked: widget.isLocked,
                  noteTags: [...widget.noteTags],
                )
              )
            );
          }
        }

        if(widget.editMode) {
          setState(() {
            isSelected = !isSelected;

            if(isSelected) {
              widget.selection.add(widget.noteId);
            } else {
              widget.selection.remove(widget.noteId);
            }
          });
        }
      },
      onLongPress: () {
        widget.enableEditMode();
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
          border: Border.all(color: isSelected ? notako_color.Colors.secondaryColor : Colors.white)
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