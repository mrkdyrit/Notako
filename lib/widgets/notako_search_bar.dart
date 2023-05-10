import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;

class NotakoSearchBar extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? hintText;

  const NotakoSearchBar({
    super.key,
    this.textEditingController,
    this.hintText,
  });

  @override
  State<NotakoSearchBar> createState() => _NotakoSearchBarState();
}

class _NotakoSearchBarState extends State<NotakoSearchBar> {
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth > 500 ? screenWidth * 0.7 : screenWidth * 0.9,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: SmoothBorderRadius(
            cornerRadius: 5,
            cornerSmoothing: 1,
          ),
        ),
        child: TextFormField(
          focusNode: searchFocusNode,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.search, color: notako_color.Colors.greyColor,),
              onPressed: () {
                // TODO: Implement search 
                searchFocusNode.unfocus();
                widget.textEditingController?.clear();
              },
            ),
            border: InputBorder.none,
            hintText: widget.hintText ?? 'Search Tags...',
          ),
          onTapOutside: (event) {
            searchFocusNode.unfocus();
          },
        ),
      ),
    );
  }
}