import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  List<XFile?> images = [];

  final ImagePicker imagePicker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await imagePicker.pickImage(source: media);

    setState(() {
     images.add(img);
    });
  }

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
                            onTap: ()  {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(
                                      child: InkWell(
                                        child: Column(
                                          children: const [
                                            Icon(
                                              Icons.photo, 
                                              color: Colors.black,
                                              size: 40,
                                            ),
                                            Text(
                                              'Images',
                                              style: FontTypography.subHeading2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }, 
                                        child: Text(
                                          'Cancel',
                                          style: FontTypography.regularText2.copyWith(
                                            color: notako_color.Colors.secondaryColor
                                          ),
                                        )
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }, 
                                        child: Text(
                                          'Ok',
                                          style: FontTypography.regularText2.copyWith(
                                            color: notako_color.Colors.secondaryColor
                                          ),
                                        )
                                      ),
                                    ],
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Attach images from your camera or gallery.',
                                          style: FontTypography.mutedText3,
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 25),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: notako_color.Colors.greyColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius: const BorderRadius.all(Radius.circular(15))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                                                  child: InkWell(
                                                    child: Column(
                                                      children: const [
                                                        Icon(
                                                          Icons.camera_alt, 
                                                          color: notako_color.Colors.greyColor,
                                                          size: 40,
                                                        ),
                                                        Text(
                                                          'Camera',
                                                          style: FontTypography.mutedText4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ),
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: notako_color.Colors.greyColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius: const BorderRadius.all(Radius.circular(15))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                                                  child: InkWell(
                                                    child: Column(
                                                      children: const [
                                                        Icon(
                                                          Icons.photo_library, 
                                                          color: notako_color.Colors.greyColor,
                                                          size: 40,
                                                        ),
                                                        Text(
                                                          'Gallery',
                                                          style: FontTypography.mutedText4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              );
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
                minLines: 12,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                // textAlign: TextAlign.left,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet purus vitae lectus viverra dignissim ac mattis ligula. Ut ut magna quis ipsum facilisis hendrerit. Vivamus vitae commodo tellus, sit amet maximus sem. Aenean iaculis nibh eu tincidunt viverra. Donec ultrices vehicula lectus, non consectetur tellus volutpat non. Phasellus pellentesque dignissim leo ut rhoncus. Integer mattis urna non eros sagittis, id lobortis libero ultrices. Maecenas in leo iaculis, placerat elit vel, blandit diam. Curabitur consequat semper ligula, et posuere odio suscipit a. Nullam vehicula odio tellus, a eleifend ipsum posuere a. Morbi id lacus orci.',
                  hintStyle: FontTypography.mutedText3,
                  hintMaxLines: 12
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