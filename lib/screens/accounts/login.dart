import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/screens/accounts/signup.dart';
import 'package:notako_app/screens/home/home.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/snackbar_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final Icon _passIconShow = const Icon(Icons.visibility, color: notako_color.Colors.greyColor,);
  final Icon _passIconHide = const Icon(Icons.visibility_off, color: notako_color.Colors.greyColor,);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login Form
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20), 
            child: SizedBox(
              height: 170,
              child: SvgPicture.asset(
                Assets.svgLogoVertical,
              ),
            ),
          ),
          Text(
            'Welcome back!',
            style: FontTypography.heading1.copyWith(color: notako_color.Colors.secondaryColor),
            textAlign: TextAlign.center,
          ),
          Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                  child: Text(
                    'Email Address',
                    style: FontTypography.heading5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10), 
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    controller: emailController,
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
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20), 
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }

                      return null;
                    },
                    controller: passwordController,
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
                      padding: const EdgeInsets.all(15),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async { 
                      if(_loginFormKey.currentState!.validate()) {

                        bool isLoggedIn = false;

                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()
                          ).then((value) => {
                            if(value.user != null) {
                              SnackBarUtil.showSnackBar(context, 'Signed in as ${emailController.text.trim()}'),
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomeScreen()),
                              )
                            }
                          });


                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            SnackBarUtil.showSnackBar(context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            SnackBarUtil.showSnackBar(context, 'Wrong password provided for that user.');
                          }
                        }
                      }
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                  }, 
                  child: Center(
                    child: Text(
                      'Don`t have an account? Sign-up here.',
                      textAlign: TextAlign.center,
                      style: FontTypography.regularText2.copyWith(
                        color: notako_color.Colors.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}