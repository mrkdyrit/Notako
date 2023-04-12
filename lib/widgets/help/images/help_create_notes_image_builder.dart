import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

Widget helpCreateNotesImage({
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
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8)
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

  Widget backdrop() {
    return Container(
      constraints: BoxConstraints(
        minHeight: imageHeight,
        minWidth: imageWidth,
      ),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.4)
      ),
    );
  }

  Widget notePreviewContent() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 500,
          maxHeight: 360,
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Cordon Bleu',
                      style: FontTypography.subHeading1,
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
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16) ,
                            child: Text(
                              'Work',
                              style: FontTypography.regularText2.copyWith(color: Colors.white),
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
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16) ,
                            child: Text(
                              'Food',
                              style: FontTypography.regularText2.copyWith(color: Colors.white),
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
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16) ,
                            child: Text(
                              'School',
                              style: FontTypography.regularText2.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet purus vitae lectus viverra dignissim ac mattis ligula. Ut ut magna quis ipsum facilisis hendrerit. Vivamus vitae commodo tellus, sit amet maximus sem. Aenean iaculis nibh eu tincidunt viverra. Donec ultrices vehicula lectus, non consectetur tellus volutpat non. Phasellus pellentesque dignissim leo ut rhoncus. Integer mattis urna non eros sagittis, id lobortis libero ultrices. Maecenas in leo iaculis, placerat elit vel, blandit diam. Curabitur consequat semper ligula, et posuere odio suscipit a. Nullam vehicula odio tellus, a eleifend ipsum posuere a. Morbi id lacus orci.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const Divider(
                      thickness: 1.5,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(Assets.helpSampleImageAttachment),
                      Image.asset(Assets.helpSampleImageAttachment),
                      Image.asset(Assets.helpSampleImageAttachment),
                    ],
                  )
                ]
              ),
            )
          ],
        ),
      ),
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
    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    child: Stack(
      children: [
        notePreview(),
        backdrop(),
        centeredLogo()
      ],
    ),
  );
}