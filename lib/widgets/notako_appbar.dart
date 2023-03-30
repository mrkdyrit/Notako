import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/utils/colors.dart'  as notako_color ;

AppBar notakoAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: SvgPicture.asset(
        Assets.svgLogoHorizontal,
        height: 22,
        width: 100,
      ),
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(color: notako_color.Colors.secondaryColor),
  );
}