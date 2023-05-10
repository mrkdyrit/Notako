import 'package:flutter/material.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field_password.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NotakoTextFormFieldPassword()
      ),
    );
  }
}