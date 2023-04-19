import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/widgets/help/images/help_welcome_image_builder.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;


class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: notako_color.Colors.greyColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          SizedBox(
            
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 10,
                    spacing: screenWidth > 500 ? 70 : screenWidth * 0.05,
                    children: [
                      InkWell(
                        onTap: () {
                          
                        },
                        child: SizedBox(
                          height: 150,
                          width: screenWidth > 500 ? screenWidth * 0.7 : screenWidth * 0.9,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 5,
                                cornerSmoothing: 1,
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Deliverables",
                                      style: NotakoTypography.heading.copyWith(
                                  fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                                  )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16)
                                  )
                                  
                                ],
                              ),
                            ),
                          )
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          )
        ],
      )
      );
    
  }
}