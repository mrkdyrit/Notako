import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

Widget imageAttachmentDialog({
  required BuildContext context,
  required Size size,
}) {
  List<XFile> pendingImages = []; // List of selected images but not yet added to note.

  return SizedBox.fromSize(
    size: size,
    child: InkWell(
      onTap: ()  {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return notakoAlertDialog(
                  titleText: 'Images', 
                  alertDescription: 'Attach images from your camera or gallery.',
                  titleIcon: Icons.photo, 
                  context: context,
                  onSubmit: () {
                    pendingImages.clear();
                  },
                  onCancel: () {
                    pendingImages.clear();
                  },
                  children: [
                    // * Checks whether the user has selected images or not
                    if(pendingImages.isEmpty) ...[
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1.5,
                              color: notako_color.Colors.greyColor,
                            ),
                            bottom: BorderSide(
                              width: 1.5,
                              color: notako_color.Colors.greyColor,
                            ),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                                    onTap: () async {
                                      // Select an image
                                      var image = await ImagePicker().pickImage(source: ImageSource.camera);

                                      if(image != null) {
                                        setState(() {
                                          pendingImages.add(image);
                                        });
                                      }
                                    },
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
                                    onTap: () async {
                                      // Select an image
                                      var image = await ImagePicker().pickMultiImage();

                                      setState(() {
                                        pendingImages = List.from(image);
                                      });
                                    },
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                    ] else ...[
                      Wrap(
                        children: [
                          for (XFile image in pendingImages) ...[
                            SizedBox(
                              width: 72,
                              height: 79,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 64.26,
                                    height: 73,
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
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      child: SizedBox(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: notako_color.Colors.primaryColor,
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          pendingImages.remove(image);
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ],
                      )
                    ],
                  ],
                );
              },
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
  );
}