import 'package:flutter/material.dart';
import 'package:notako_app/screens/settings/note_password.dart';
import 'package:notako_app/utils/font_typography.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Text(
              'Settings',
              style: FontTypography.heading3,
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
                      children: const [
                        Text(
                          'Note Password',
                          style: FontTypography.subHeading2,
                        ),
                        Text(
                          'Set up or remove NotaKo`s note password.',
                          style: FontTypography.mutedText3,
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