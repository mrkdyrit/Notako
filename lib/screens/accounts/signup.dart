import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/screens/accounts/login.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isHidden = true;
  final Icon _passIconShow = const Icon(Icons.visibility, color: notako_color.Colors.greyColor,);
  final Icon _passIconHide = const Icon(Icons.visibility_off, color: notako_color.Colors.greyColor,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10), 
            child: SizedBox(
              height: 170,
              child: SvgPicture.asset(
                Assets.svgLogoVertical,
              ),
            ),
          ),
          Text(
            'Ready to take notes?',
            style: FontTypography.heading1.copyWith(color: notako_color.Colors.secondaryColor),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            child: Text(
              'Email Address',
              style: FontTypography.heading5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10), 
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, color: notako_color.Colors.secondaryColor,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            child: Text(
              'Password',
              style: FontTypography.heading5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10,), 
            child: TextField(
              onTapOutside: (event) {
                setState(() {
                  _isHidden = true;
                });
              },
              obscureText: _isHidden,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: notako_color.Colors.secondaryColor,),
                suffixIcon: IconButton(
                  icon: _isHidden ? _passIconShow: _passIconHide, 
                  onPressed: () { 
                    setState(() {
                      _isHidden ? _isHidden = false: _isHidden = true;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            child: Text(
              'Confirm Password',
              style: FontTypography.heading5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20), 
            child: TextField(
              onTapOutside: (event) {
                setState(() {
                  _isHidden = true;
                });
              },
              obscureText: _isHidden,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: notako_color.Colors.secondaryColor,),
                suffixIcon: IconButton(
                  icon: _isHidden ? _passIconShow: _passIconHide, 
                  onPressed: () { 
                    setState(() {
                      _isHidden ? _isHidden = false: _isHidden = true;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: notako_color.Colors.secondaryColor,
                padding: const EdgeInsets.all(15)
              ),
              onPressed: () { 
                
              },
              child: const Text(
                'Login',
                style: FontTypography.regularText1,
              ),
            ),
          ),
          TextButton(
            onPressed: () { 
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            }, 
            child: Text(
              'Already have an account? Log-in here.',
              textAlign: TextAlign.center,
              style: FontTypography.regularText2.copyWith(
                color: notako_color.Colors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}