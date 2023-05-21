import 'package:flutter/material.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field.dart';

class NotakoTextFormFieldPassword extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? textFieldController;
  final Color? prefixIconColor;
  final TextInputType? keyboardType;

  const NotakoTextFormFieldPassword({
    super.key,
    this.validator,
    this.hintText,
    this.textFieldController,
    this.prefixIconColor,
    this.keyboardType,
  });

  @override
  State<NotakoTextFormFieldPassword> createState() => NotakoTextFormFieldPasswordState();
}

class NotakoTextFormFieldPasswordState extends State<NotakoTextFormFieldPassword> {

  bool showPass = false;

  IconData passIconShow = Icons.visibility;
  IconData passIconHide = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {

    return NotakoTextFormField(
      textFieldController: widget.textFieldController,
      prefixIcon: Icons.lock,
      prefixIconColor: widget.prefixIconColor,
      suffixIcon: showPass ? passIconHide : passIconShow,
      suffixIconOnClick: () {
        setState(() {
          showPass = !showPass;
        });
      },
      hintText: widget.hintText,
      obscureText: !showPass,
      onTapOutside: () {
        setState(() {
          showPass = false;
        });
      },
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}