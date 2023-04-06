import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';

class NotePasswordScreen extends StatefulWidget {
  const NotePasswordScreen({super.key});

  @override
  State<NotePasswordScreen> createState() => _NotePasswordScreenState();
}

class _NotePasswordScreenState extends State<NotePasswordScreen> {
  final passwordFormKey = GlobalKey<FormState>();

  bool _isHidden = true;
  final Icon _passIconShow = const Icon(Icons.visibility, color: notako_color.Colors.greyColor,);
  final Icon _passIconHide = const Icon(Icons.visibility_off, color: notako_color.Colors.greyColor,);

  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: FontTypography.heading2.copyWith(color: notako_color.Colors.secondaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: notako_color.Colors.secondaryColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Text(
              'Note Password',
              style: FontTypography.heading3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return notakoAlertDialog(
                            titleText: 'Change Password', 
                            alertDescription: 'Add or change the password used for note locking.',
                            titleIcon: Icons.lock, 
                            context: context, 
                            onCancel: () {
                              passwordConfirmationController.clear();
                              passwordController.clear();
                            },
                            onSubmit: () {
                              passwordConfirmationController.clear();
                              passwordController.clear();
                            },
                            children: [
                              Form(
                                // key: passwordFormKey,
                                child: Column(
                                  children: [
                                    TextFormField(
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
                                        prefixIcon: const Icon(Icons.lock, color: notako_color.Colors.greyColor,),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
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
                                          prefixIcon: const Icon(Icons.lock, color: notako_color.Colors.greyColor,),
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
                                    )
                                  ],
                                ),
                              ),
                            ]
                          );
                        }
                      );
                    }
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Change Password',
                          style: FontTypography.subHeading2,
                        ),
                        Text(
                          'Password not set',
                          style: FontTypography.mutedText3,
                        ),
                      ],
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }
}