import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/utils/colors.dart'  as notako_color ;

class NotakoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotakoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SvgPicture.asset(
            Assets.svgLogoHorizontal,
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: notako_color.Colors.secondaryColor),
    );
  }
  
  @override
  Size get preferredSize =>   AppBar().preferredSize;
}