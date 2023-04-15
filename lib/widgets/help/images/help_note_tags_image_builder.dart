import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/assets/fonts/fonts.dart';
import 'package:notako_app/utils/color_config.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/help/images/backdrop_builder.dart';

Widget helpNoteTagsImage({
  required double imageWidth,
  required double imageHeight,
}) {

  Widget demoNoteTags() {
    return SizedBox(
      width: imageWidth > 500 ? 500 : imageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: imageWidth > 500 ? 500 : imageWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Note Tags',
                style: NotakoTypography.heading.copyWith(
                  fontSize: NotakoTypography.calculateFontSize(imageWidth, FontTypography.fs2)
                )
              ),
            ),
          ),
          Wrap(
            runSpacing: 20,
            spacing: imageWidth > 500 ? 70 : imageWidth * 0.1,
            children: [
              SizedBox(
                height: 36,
                width: 170,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 5,
                      cornerSmoothing: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'School',
                        style: TextStyle(
                          color: notako_color.Colors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '12',
                        style: TextStyle(
                          color: notako_color.Colors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(
                height: 36,
                width: 170,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 5,
                      cornerSmoothing: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Work',
                        style: TextStyle(
                          color: notako_color.Colors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: notako_color.Colors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(
                height: 36,
                width: 170,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 5,
                      cornerSmoothing: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Food',
                        style: TextStyle(
                          color: notako_color.Colors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '6',
                        style: TextStyle(
                          color: notako_color.Colors.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
              ),
              
            ],
          )
        ],
      )
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
              child: demoNoteTags(),
            ),
          )
        ),
      ),
    );
  }

  Widget noteTagPreview() {
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
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8,),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.menu,
                          color: notako_color.Colors.secondaryColor,
                          size: 20,
                        ),
                        SvgPicture.asset(
                          Assets.svgLogoHorizontal,
                          height: 15,
                          width: 100,
                        ),
                        const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 20
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: SizedBox(
                        width: imageWidth - 30,
                        height: 25,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 5,
                              cornerSmoothing: 1,
                            ),
                            color: Colors.white
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Search notes...',
                                      style: FontTypography.mutedText5,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.search,
                                      size: 16,
                                      color: ColorConfig.mutedColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Wrap(
                        children: [      
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16, top: 16),
                            child: Text(
                              'Note Tags',
                              style: TextStyle(
                                fontFamily: Fonts.fontFamily,
                                fontSize: FontTypography.fs6,
                                fontWeight: FontWeight.bold,
                                color: ColorConfig.headingColor,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 36,
                                width: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 5,
                                      cornerSmoothing: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text(
                                        'Work',
                                        style: TextStyle(
                                          color: notako_color.Colors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontTypography.fs7,
                                        ),
                                      ),
                                      Text(
                                        '4',
                                        style: TextStyle(
                                          color: notako_color.Colors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontTypography.fs7,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ),
                              SizedBox(
                                height: 36,
                                width: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 5,
                                      cornerSmoothing: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text(
                                        'School',
                                        style: TextStyle(
                                          color: notako_color.Colors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontTypography.fs7,
                                        ),
                                      ),
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          color: notako_color.Colors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontTypography.fs7,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: SizedBox(
                              height: 36,
                              width: 70,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: 5,
                                    cornerSmoothing: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      'Food',
                                      style: TextStyle(
                                        color: notako_color.Colors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontTypography.fs7,
                                      ),
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        color: notako_color.Colors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontTypography.fs7,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
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
    child: SizedBox(
      child: Stack(
        children: [
          zoomedBackground(),
          backdrop(
            imageWidth: imageWidth, 
            imageHeight: imageHeight
          ),
          noteTagPreview()
        ],
      ),
    )
  );
}