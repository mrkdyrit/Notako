import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/screens/accounts/signup.dart';
import 'package:notako_app/screens/home/home.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/snackbar_util.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login Form
  final _loginFormKey = GlobalKey<FormState>();

  final GlobalKey<NavigatorState> loginScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: loginScaffoldKey,
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 20), 
                    child: SizedBox(
                      height: 170,
                      child: SvgPicture.asset(
                        Assets.svgLogoVertical,
                      ),
                    ),
                  ),
                  Text(
                    'Welcome back!',
                    style: NotakoTypography.heading.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs1), 
                      color: notako_color.Colors.secondaryColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: screenWidth > 500 ? screenWidth * 0.7 : screenWidth * 0.9,
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                                  child: Text(
                                    'Email Address',
                                    style: NotakoTypography.heading.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10), 
                                  child: NotakoTextFormField(
                                    textFieldController: emailController,
                                    prefixIcon: Icons.email,
                                    prefixIconColor: notako_color.Colors.secondaryColor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                        return 'Invalid Email';
                                      }
                                      
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                                  child: Text(
                                    'Password',
                                    style: NotakoTypography.heading.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20), 
                                  child: NotakoTextFormFieldPassword(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password.';
                                      }

                                      return null;
                                    },
                                    prefixIconColor: notako_color.Colors.secondaryColor,
                                    textFieldController: passwordController,
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
                                        try {
                                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                                            email: emailController.text.trim(),
                                            password: passwordController.text.trim()
                                          ).then((value) => {
                                            if(value.user != null) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => const HomeScreen()),
                                              ),
                                            }
                                          });


                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            SnackBarUtil.showSnackBar(context, 'No user found for that email.');
                                          } else if (e.code == 'wrong-password') {
                                            SnackBarUtil.showSnackBar(context, 'Invalid Credentials');
                                          }
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Login',
                                      style: NotakoTypography.bodyText.copyWith(
                                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () { 
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                                  }, 
                                  child: Center(
                                    child: Text(
                                      'Don`t have an account? Sign-up here.',
                                      textAlign: TextAlign.center,
                                      style: NotakoTypography.bodyText.copyWith(
                                        fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                                        color: notako_color.Colors.secondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ]
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      )
    );
  }
}