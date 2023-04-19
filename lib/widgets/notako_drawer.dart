import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/screens/help/help.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/v2/font_typography.dart';

class NotakoNavDrawer extends StatelessWidget {
  final Function(Widget) changeScreen;
  final List<dynamic> screenList;

  const NotakoNavDrawer({
    super.key, 
    required this.changeScreen,
    required this.screenList,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30;
    const double horizontalGap = 0.0;
    const Color iconColor = notako_color.Colors.secondaryColor;

    double screenWidth = MediaQuery.of(context).size.width;
    

    TextStyle navTextStyle = NotakoTypography.subHeading.copyWith(
      fontSize: NotakoTypography.calculateFontSize(screenWidth,  NotakoTypography.fs5),
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 80.0,
            child: DrawerHeader(
              // padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(
                    context,
                    color: notako_color.Colors.greyColor, 
                    width: 1.0
                  ),
                ),
              ),
              child: SizedBox(
                height: 56,
                child: SvgPicture.asset(Assets.svgLogoHorizontal,),
              ),
            ),
          ),
          for(var screen in screenList) ...[
            ListTile(
              horizontalTitleGap: horizontalGap,
              title: Text(
                screen['name'],
                style: navTextStyle
              ),
              leading: Icon(
                screen['details']['icon'], 
                color: iconColor, 
                size: iconSize,
              ),
              onTap: () { 
                Navigator.pop(context); 
                changeScreen(screen['details']['screen']); 
              },
            )
          ],
          ListTile(
            horizontalTitleGap: horizontalGap,
            title: Text(
              'Logout',
              style: navTextStyle
            ),
            leading: const Icon(Icons.exit_to_app, color: iconColor, size: iconSize,),
            onTap: () async {
              if(FirebaseAuth.instance.currentUser != null) {
                await FirebaseAuth.instance.signOut();
              }
            },
          ),
          ListTile(
            horizontalTitleGap: horizontalGap,
            title: Text(
              'Help',
              style: navTextStyle
            ),
            leading: const Icon(Icons.question_mark, color: iconColor, size: iconSize,),
            onTap: () { 
              Navigator.pop(context); 
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
          ),
        ],
      ),
    );
  }
}