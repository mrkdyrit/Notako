import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class NotakoTextFormField extends StatefulWidget {
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Function()? suffixIconOnClick;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController? textFieldController;
  final Function()? onTapOutside;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;

  const NotakoTextFormField({
    super.key,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconOnClick,
    this.hintText,
    this.obscureText,
    this.textFieldController,
    this.onTapOutside,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType,
  });

  @override
  State<NotakoTextFormField> createState() => _NotakoTextFormFieldState();
}

class _NotakoTextFormFieldState extends State<NotakoTextFormField> {

  // Default to unfocus state
  Color iconColor = notako_color.Colors.contentColor;

  Color unfocusColor = notako_color.Colors.contentColor;
  Color hoverFocusColor = notako_color.Colors.secondaryColor;

  FocusNode ntfFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    ntfFocusNode.addListener(() {
      setState(() {
        iconColor = ntfFocusNode.hasFocus ? hoverFocusColor : unfocusColor; 
      });
    });
  }

  @override
  void dispose() {
    ntfFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textFieldController,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null ? Icon(
          widget.prefixIcon,
          color: widget.prefixIconColor ?? iconColor,
        ) : null,
        suffixIcon: widget.suffixIcon != null ? IconButton(
          icon: Icon(
            widget.suffixIcon,
            color: widget.suffixIconColor ?? iconColor,
          ),
          onPressed: widget.suffixIconOnClick,
        ) : null,
        border: OutlineInputBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 5,
            cornerSmoothing: 1,
          ),
          borderSide: const BorderSide(
            color: notako_color.Colors.contentColor,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hoverFocusColor,
          ),
        ),
        hintText: widget.hintText,
      ),
      focusNode: ntfFocusNode,
      obscureText: widget.obscureText ?? false,
      onTapOutside: (event) {
        ntfFocusNode.unfocus();
        widget.onTapOutside?.call();
      },
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
    );
  }
}