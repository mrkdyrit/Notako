import 'package:flutter/material.dart';
import 'package:notako_app/utils/font_typography.dart';
import 'package:notako_app/utils/colors.dart' as notako_color;
import 'package:notako_app/utils/v2/font_typography.dart';
import 'package:notako_app/widgets/dialogs/notako_alert_dialog.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field.dart';
import 'package:notako_app/widgets/forms/textfields/notako_text_form_field_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<String> passwordOptions = <String>['None', 'Password', 'PIN'];

  String selectedPasswordOption = '';

  void setSelectedPasswordOption(String value) async {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.setString('selectedPasswordOption', value);
  }

  void getSelectedPasswordOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedPasswordOption = prefs.getString('selectedPasswordOption') ?? 'None';
    });
  }

  @override
  void initState() {
    super.initState();

    getSelectedPasswordOption();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
            Text(
              'Note Password',
              style: NotakoTypography.heading.copyWith(
                fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 15),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  items: passwordOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    
                    setSelectedPasswordOption(value!);

                    setState(() {
                      selectedPasswordOption = value;
                    });
                  },
                  icon: const Icon(
                    Icons.expand_more, 
                    color: notako_color.Colors.secondaryColor,
                  ),
                  hint:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password Type',
                            style: NotakoTypography.subHeading.copyWith(
                              fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                            ),
                          ),
                          Text(
                            selectedPasswordOption,
                            style: NotakoTypography.mutedText.copyWith(
                              fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0,),
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
                                    NotakoTextFormFieldPassword(
                                      textFieldController: passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty || !RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,}$').hasMatch(value)) {
                                          return '• Passwords must be alphanumeric. \n• Passwords must be 8 characters long. \n• Password must contain at least one uppercase letter.';
                                        }

                                        return null;
                                      },
                                      hintText: 'Password',
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: NotakoTextFormFieldPassword(
                                        textFieldController: passwordConfirmationController,
                                        validator: (value) {
                                          if(passwordController.text.trim() != value || value == null || value.isEmpty) {
                                            return 'Passwords does not match';
                                          }

                                          return null;
                                        },
                                        hintText: 'Confirm Password',
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
                      children: [
                        Text(
                          'Change Password',
                          style: NotakoTypography.subHeading.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs5)
                          ),
                        ),
                        Text(
                          'Password not set',
                          style: NotakoTypography.mutedText.copyWith(
                            fontSize: NotakoTypography.calculateFontSize(screenWidth, NotakoTypography.fs6)
                          ),
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