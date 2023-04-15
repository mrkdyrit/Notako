import 'package:flutter/material.dart';
import 'package:notako_app/screens/settings/note_password.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/v2/font_typography.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              'Settings',
              style: NotakoTypography.heading.copyWith(
                fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotePasswordScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note Password',
                          style: NotakoTypography.subHeading.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                          ),
                        ),
                        Text(
                          'Set up or remove NotaKo`s note password.',
                          style: NotakoTypography.mutedText.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.chevron_right
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}