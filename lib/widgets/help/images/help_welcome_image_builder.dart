import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/widgets/help/images/backdrop_builder.dart';
import 'package:notako_app/widgets/help/images/note_preview_content_builder.dart';

Widget helpWelcomeImage({
  required double imageWidth,
  required double imageHeight,
}) {

  Widget centeredLogo() {
    return SizedBox(
      height: imageHeight,
      width: imageWidth,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: SmoothBorderRadius(
              cornerRadius: 15,
              cornerSmoothing: 1,
            )
          ),
          child: SizedBox(
            height: 156,
            width: 144,
            child: SvgPicture.asset(Assets.svgLogoVertical),
          ),
        ),
      )
    );
  }

  Widget notePreview() {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: ClipRect(
        child: Align(
          heightFactor: 1,
          alignment: Alignment.topLeft,
          child: Wrap(
            children: [
              notePreviewContent(),
            ],
          ),
        ),
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
        Transform.scale(
          scale: 1.15,
          child: notePreview(),
        ),
        backdrop(imageHeight: imageHeight, imageWidth: imageWidth),
        centeredLogo()
      ],
    ),
  );
}