import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/widgets/help/images/backdrop_builder.dart';

Widget helpLockNotesImage({
  required double imageWidth,
  required double imageHeight,
}) {
  
  Widget passwordSampleScreen() {
    return Column(
      children: const [
        SizedBox(
          
        ),
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
        passwordSampleScreen(),
        backdrop(
          imageHeight: imageHeight,
          imageWidth: imageWidth,
        )
      ],
    ),
  );
}