import 'package:flutter/material.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Note',
          style: FontTypography.heading2.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: notako_color.Colors.secondaryColor),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(Icons.save)
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical( 
                    top: Radius.circular(25.0),
                  ),
                ),
                context: context, 
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox.fromSize(
                          size: const Size(70,50),
                          child: InkWell(
                            onTap: () {

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
                        ),
                        SizedBox.fromSize(
                          size: const Size(70,50),
                          child: InkWell(
                            onTap: () {

                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.photo, 
                                  color: Colors.black
                                ),
                                Text(
                                  'Images',
                                  style: FontTypography.subHeading3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(70,50),
                          child: InkWell(
                            onTap: () {

                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.lock, 
                                  color: Colors.black
                                ),
                                Text(
                                  'Password',
                                  style: FontTypography.subHeading3,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            }, 
            icon: const Icon(Icons.more_horiz)
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Note Title',
                  border: InputBorder.none,
                  hintStyle: FontTypography.mutedText1,
                  counterText: ''
                ),
                style: FontTypography.subHeading1,
                maxLines: 1,
                maxLength: 100,
              ),
              TextField(
                minLines: 6,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
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