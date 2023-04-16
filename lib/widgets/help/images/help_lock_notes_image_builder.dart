import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/help/images/backdrop_builder.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Widget helpLockNotesImage({
  required double imageWidth,
  required double imageHeight,
}) {
  
  Widget passwordSampleScreen() {
    return SizedBox(
      height: imageHeight,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: Container (
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: SmoothBorderRadius (
                    cornerRadius: 15,
                    cornerSmoothing: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap (
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'Password Type',
                        style: NotakoTypography.subHeading.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs5)
                        ),
                      ),
                      Text(
                        'None',
                        style: NotakoTypography.mutedText.copyWith(
                          fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: 300,
                child: Container (
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: SmoothBorderRadius (
                      cornerRadius: 15,
                      cornerSmoothing: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap (
                      direction: Axis.vertical,
                      children: [
                        Text(
                          'Change Password',
                          style: NotakoTypography.subHeading.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs5)
                          ),
                        ),
                        Text(
                          'Password not set',
                          style: NotakoTypography.mutedText.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget zoomedBackground() {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: ClipRect(
        child: Align(
          heightFactor: 1,
          child: Center(
            child: Transform.scale(
              alignment: Alignment.center,
              scale: 1.25,
              child: passwordSampleScreen(),
            ),
          )
        ),
      ),
    );
  }

  Widget sampleSettingScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              height: imageHeight - 20,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 15,
                  cornerSmoothing: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Wrap(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.chevron_left,
                          color: notako_color.Colors.secondaryColor,
                        ),
                        Text(
                          'Setting',
                          style: NotakoTypography.heading.copyWith(
                            color: notako_color.Colors.secondaryColor,
                            fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Wrap(
                        children: [
                          Text(
                            'Note Password',
                            style: NotakoTypography.heading.copyWith(
                              fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Wrap(
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Password Type',
                                            style: NotakoTypography.subHeading.copyWith(
                                              fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                                            ),
                                          ),
                                          Text(
                                            'Password',
                                            style: NotakoTypography.mutedText.copyWith(
                                              fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                                            ),
                                          ),              
                                        ],
                                      ),
                                      const Icon(
                                        Icons.expand_more,
                                        color: notako_color.Colors.secondaryColor,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Change Password',
                                          style: NotakoTypography.subHeading.copyWith(
                                            fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                                          ),
                                        ),
                                        Text(
                                          'Password not set',
                                          style: NotakoTypography.mutedText.copyWith(
                                            fontSize: NotakoTypography.calculateFontSize(imageWidth, NotakoTypography.fs6)
                                          ),
                                        ),              
                                      ],
                                    )
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
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
        zoomedBackground(),
        backdrop(
          imageHeight: imageHeight,
          imageWidth: imageWidth,
        ),
        sampleSettingScreen(),
      ],
    ),
  );
}