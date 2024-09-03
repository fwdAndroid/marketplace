import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/screens/auth/auth_login.dart';
import 'package:marketplace/utils/colors.dart';
import 'package:marketplace/widgets/save_button.dart';
import 'package:marketplace/widgets/text_form_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController providerEmailController = TextEditingController();
  TextEditingController providerFullNameContoller = TextEditingController();
  TextEditingController providerPassController = TextEditingController();
  TextEditingController providerConfrimPassController = TextEditingController();
  TextEditingController providerContactController = TextEditingController();
  TextEditingController providerLocation = TextEditingController();

  //Password Check
  bool passwordVisible = false;
  bool passwordVisibleConfrim = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisibleConfrim = true;
  }

  String? selectedLocation; // New variable to hold the selected description
  void setSelectedDescription(String description) {
    setState(() {
      selectedLocation = description;
      providerLocation.text =
          description; // Optionally set the text field value
    });
  }

  //loader
  bool isLoading = false;

  //Image
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Crea tu Cuenta",
                style: GoogleFonts.workSans(
                    fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: TextFormInputField(
                  controller: providerEmailController,
                  hintText: "Email Address",
                  IconSuffix: Icons.email,
                  textInputType: TextInputType.emailAddress),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                child: TextFormField(
                  obscureText: passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    fillColor: textColor,
                    filled: true,
                    hintStyle: GoogleFonts.nunitoSans(fontSize: 16),
                    hintText: "New Password",
                  ),
                  controller: providerPassController,
                )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 8, bottom: 8),
                child: TextFormField(
                  obscureText: passwordVisibleConfrim,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisibleConfrim
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisibleConfrim = !passwordVisibleConfrim;
                          },
                        );
                      },
                    ),
                    fillColor: textColor,
                    filled: true,
                    hintStyle: GoogleFonts.nunitoSans(fontSize: 16),
                    hintText: "Confirm Password",
                  ),
                  controller: providerConfrimPassController,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : SaveButton(title: "SIGNUP", onTap: () async {}),
            ),
            const SizedBox(
              height: 20,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterSocialButton(
                  onTap: () {},
                  mini: true,
                  buttonType: ButtonType.google,
                ),
                const SizedBox(
                  width: 20,
                ),
                FlutterSocialButton(
                  onTap: () {},
                  mini: true,
                  buttonType: ButtonType.facebook,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => AuthLogin()));
                  },
                  child: Text.rich(TextSpan(
                      text: 'Already Have an account ',
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Sign IN',
                          style: GoogleFonts.workSans(
                              color: mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )
                      ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Fucctions
  /// Select Image From Gallery
  selectImage() async {}
}
