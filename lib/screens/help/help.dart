import 'package:flutter/material.dart';
import 'package:notako_app/screens/help/help_create_notes.dart';
import 'package:notako_app/screens/help/help_image_attachments.dart';
import 'package:notako_app/screens/help/help_lock_notes.dart';
import 'package:notako_app/screens/help/help_note_tags.dart';
import 'package:notako_app/screens/help/help_welcome.dart';
import 'package:notako_app/screens/home/home.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/v2/font_typography.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Widget> helpPageSlides = [
    const HelpWelcomeScreen(),
    const HelpCreateNotesScreen(),
    const HelpNoteTagsScreen(),
    const HelpImageAttachmentsScreen(),
    const HelpLockNotesScreen(),
  ];

  final pageViewController = PageController(viewportFraction: 1.1);

  List<String> slidesStatus = [
    'true',
    'false',
    'false',
    'false',
    'false',
  ];

  bool isLastPage = false;
  String buttonText = 'Next';

  bool activeScreen = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: helpPageSlides.length,
              controller: pageViewController,
              itemBuilder: (context, index) {
                return FractionallySizedBox(
                  widthFactor: 1 / pageViewController.viewportFraction,
                  child: helpPageSlides[index],
                );
              },
              onPageChanged: (index) {
                setState(() {
                  if(index == helpPageSlides.length - 1) {
                    isLastPage = true;
                    buttonText = 'Finish';
                  } else {
                    isLastPage = false;
                    buttonText = 'Next';
                  }

                  slidesStatus.clear();

                  for(int i = 0; i <= helpPageSlides.length - 1; i++){
                    if(index == i) {
                      slidesStatus.add('true');
                    } else {
                      slidesStatus.add('false');
                    }
                  }
                });
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: screenWidth > 500 ? 500 : screenWidth * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: notako_color.Colors.secondaryColor,
                    padding: const EdgeInsets.all(15),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if(isLastPage) {
                      Navigator.of(context).pop();
                    } else {
                      pageViewController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                    }
                  }, 
                  child: Text(
                    buttonText,
                    style: NotakoTypography.bodyText.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                    ),
                  )
                ),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8,),
            child: SizedBox(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...slidesStatus.map((isActive) {
                    return Icon(
                      Icons.circle,
                      size: 10,
                      color: isActive == 'true' ? notako_color.Colors.secondaryColor : notako_color.Colors.greyColor,
                    );
                  })
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}