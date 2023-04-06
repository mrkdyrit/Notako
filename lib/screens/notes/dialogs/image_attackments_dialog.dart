import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

Widget imageAttachmentDialog({
  required BuildContext context,
  required Size size,
}) {
  var pendingImages = []; // List of selected images but not yet added to note.

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
                  titleIcon: Icons.photo, 
                  context: context,
                  onSubmit: () {
                    pendingImages.clear();
                  },
                  onCancel: () {
                    pendingImages.clear();
                  },
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Attach images from your camera or gallery.',
                        style: FontTypography.mutedText3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 10, bottom: 10),
                    //   child: Divider(
                    //     thickness: 1.5,
                    //     color: notako_color.Colors.greyColor,
                    //   ),
                    // ),
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
                                    onTap: () {
                                      // getImage(ImageSource.camera);
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
                                        pendingImages.add(image);
                                      });
                                      // getImage(ImageSource.gallery);
                                    },
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                    ] else ...[
                      
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