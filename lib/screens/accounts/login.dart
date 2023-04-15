import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notako_app/assets/assets.dart';
import 'package:notako_app/screens/accounts/signup.dart';
import 'package:notako_app/screens/home/home.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/snackbar_util.dart';
import 'package:notako_app/utils/v2/font_typography.dart';

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
                                              // Navigator.pop(context),
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