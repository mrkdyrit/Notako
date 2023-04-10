import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/firebase_options.dart';
import 'package:notako_app/screens/accounts/login.dart';
import 'package:notako_app/screens/home/home.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/font_typography.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notako_app/utils/snackbar_util.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _isHidden = true;
  final Icon _passIconShow = const Icon(Icons.visibility, color: notako_color.Colors.greyColor,);
  final Icon _passIconHide = const Icon(Icons.visibility_off, color: notako_color.Colors.greyColor,);

  // TextField Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  // Registration Form
  final _regisFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
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
          Form(
            key: _regisFormKey,
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
                  padding: const EdgeInsets.only(left: 10, right: 10,), 
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty || !RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,}$').hasMatch(value)) {
                        return '• Passwords must be alphanumeric. \n• Passwords must be 8 characters long. \n• Password must contain at least one uppercase letter.';
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
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                  child: Text(
                    'Confirm Password',
                    style: FontTypography.heading5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20), 
                  child: TextFormField(
                    validator: (value) {
                      if(passwordController.text.trim() != value || value == null || value.isEmpty) {
                        return 'Passwords does not match';
                      }

                      return null;
                    },
                    controller: passwordConfirmationController,
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
                          print(e);
                        }
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: FontTypography.regularText1,
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
                      style: FontTypography.regularText2.copyWith(
                        color: notako_color.Colors.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}