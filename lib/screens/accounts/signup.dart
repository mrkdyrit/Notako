import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/screens/accounts/login.dart';
import 'package:notako_app/screens/home/home.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notako_app/utils/snackbar_util.dart';
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field_password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TextField Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  // Registration Form
  final _regisFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                    padding: const EdgeInsets.only(top: 0, bottom: 10), 
                    child: SizedBox(
                      height: 170,
                      child: SvgPicture.asset(
                        Assets.svgLogoVertical,
                      ),
                    ),
                  ),
                  Text(
                    'Ready to take notes?',
                    style: NotakoTypography.heading.copyWith(
                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs1),
                      color: notako_color.Colors.secondaryColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: _regisFormKey,
                    child: SizedBox(
                      width: screenWidth > 500 ? screenWidth * 0.7 : screenWidth * 0.9,
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                                child: Text(
                                  'Email Address',
                                  style: NotakoTypography.heading.copyWith(
                                    fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
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
                                    fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10,), 
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
                                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                                child: Text(
                                  'Confirm Password',
                                  style: NotakoTypography.heading.copyWith(
                                    fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20), 
                                child: NotakoTextFormFieldPassword(
                                  validator: (value) {
                                    if(passwordController.text.trim() != value || value == null || value.isEmpty) {
                                      return 'Passwords does not match';
                                    }

                                    return null;
                                  },
                                  prefixIconColor: notako_color.Colors.secondaryColor,
                                  textFieldController: passwordConfirmationController,
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
                                    if(_regisFormKey.currentState!.validate()) {
                                      try {

                                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password: passwordController.text.trim(),
                                        ).then((value) => {
                                          if(value.user != null) {
                                            // Navigator.pop(context),
                                            // SnackBarUtil.showSnackBar(context, 'Signed in as ${emailController.text.trim()}'),
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                                            )
                                          }
                                        });

                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          SnackBarUtil.showSnackBar(context, 'The password provided is too weak.');
                                        } else if (e.code == 'email-already-in-use') {
                                          SnackBarUtil.showSnackBar(context, 'The account already exists for that email.');
                                        }
                                      } catch (e) {
                                        SnackBarUtil.showSnackBar(context, 'Something went wrong.');
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: NotakoTypography.bodyText.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () { 
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                }, 
                                child: Center(
                                  child: Text(
                                    'Already have an account? Log-in here.',
                                    textAlign: TextAlign.center,
                                    style: NotakoTypography.bodyText.copyWith(
                                      fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6),
                                      color: notako_color.Colors.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}