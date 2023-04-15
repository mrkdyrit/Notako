import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/utils/color_config.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/widgets/help/images/backdrop_builder.dart';
import 'package:notako_app/widgets/help/images/note_preview_content_builder.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Widget helpImageAttachmentImage({
  required double imageWidth,
  required double imageHeight,
}) {

  Widget zoomedBackground() {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: ClipRect(
        child: Align(
          heightFactor: 1,
          child: Wrap(
            children: [
              Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: 1.5,
                child: notePreviewContent()
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageAttachmentPreview() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 300,
            height: imageHeight - 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: SmoothBorderRadius(
                cornerRadius: 15,
                cornerSmoothing: 1,
              ),
            ),
            child: ClipRRect(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8,),
                child: Wrap(
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.chevron_left,
                          color: notako_color.Colors.secondaryColor,
                        ),
                        Text(
                          'View Note',
                          style: FontTypography.heading3
                        ),
                        Icon(
                          Icons.save,
                          color: notako_color.Colors.secondaryColor,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 5),
                      child: Text(
                        'Cordon Bleu',
                        style: FontTypography.heading3
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: notako_color.Colors.secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8)
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10) ,
                              child: Text(
                                'Work',
                                style: FontTypography.regularText4.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: notako_color.Colors.secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8)
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10) ,
                              child: Text(
                                'Food',
                                style: FontTypography.regularText4.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: notako_color.Colors.secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8)
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10) ,
                              child: Text(
                                'School',
                                style: FontTypography.regularText4.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet purus vitae lectus viverra dignissim ac mattis ligula. Ut ut magna quis ipsum facilisis hendrerit. Vivamus vitae commodo tellus, sit amet maximus sem. Aenean iaculis nibh eu tincidunt viverra. Donec ultrices vehicula lectus, non consectetur tellus volutpat non. Phasellus pellentesque dignissim leo ut rhoncus. Integer mattis urna non eros sagittis, id lobortis libero ultrices. ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: FontTypography.fs6,
                          color: ColorConfig.mutedColor,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.helpSampleImageAttachment,
                          width: 80,
                          height: 80,
                        ),
                        Image.asset(
                          Assets.helpSampleImageAttachment,
                          width: 80,
                          height: 80,
                        ),
                        Image.asset(
                          Assets.helpSampleImageAttachment,
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ],
                )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  return ClipRRect(
    borderRadius: const SmoothBorderRadius.only(
      bottomLeft: SmoothRadius(
        cornerRadius: 15,
        cornerSmoothing: 1,
      ),
      bottomRight: SmoothRadius(
        cornerRadius: 15,
        cornerSmoothing: 1,
      ),
    ),
    child: Stack(
      children: [
        zoomedBackground(),
        backdrop(imageWidth: imageWidth, imageHeight: imageHeight),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: imageAttachmentPreview(),
        )
      ],
    ),
  );
}