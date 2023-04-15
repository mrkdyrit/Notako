import 'package:flutter/material.dart';
import 'package:notako_app/utils/v2/font_typography.dart';

class TypoTestScreen extends StatefulWidget {
  const TypoTestScreen({super.key});

  @override
  State<TypoTestScreen> createState() => _TypoTestScreenState();
}

class _TypoTestScreenState extends State<TypoTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Sample Text",
          style: TextStyle(
            fontSize: NotakoTypography.calculateFontSize(MediaQuery.of(context).size.width, 16)
          ),
        ),
      )
    );
  }
}