import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/utils/color_config.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/widgets/help/images/backdrop_builder.dart';

Widget helpCreateNotesImage({
  required double imageWidth,
  required double imageHeight,
}) {
  // Widget addIcon() {
  //   return Container(
  //     height: imageHeight,
  //     width: imageWidth,
  //     alignment: Alignment.bottomRight,
  //     child: Padding(
  //       padding: const EdgeInsets.only(right: 20),
  //       child: Container(
  //         height: 60,
  //         width: 60,
  //         decoration: const BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: notako_color.Colors.secondaryColor,
  //         ),
  //         child: const Icon(
  //           Icons.add,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget noteScreenPreviewContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 300,
        height: imageHeight - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: SmoothBorderRadius(
            cornerRadius: 15,
            cornerSmoothing: 1,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(Assets.helpEmptyNoteIndicator,),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'No Notes',
                      style: TextStyle(
                        color: notako_color.Colors.primaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const Text(
                    'Get started with a new note.',
                    style: FontTypography.mutedText4
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: notako_color.Colors.secondaryColor,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget noteScreenPreview() {
    return Column(
      children: [
        Center(
          child: noteScreenPreviewContent(),
        )
      ],
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
        Transform.scale(
          alignment: Alignment.bottomCenter,
          scale: 1.75,
          child: noteScreenPreview(),
        ),
        backdrop(imageHeight: imageHeight, imageWidth: imageWidth),
        noteScreenPreview(),
      ],
    ),
  );
}