import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/common/commons.dart';
import 'package:news_app/common/theme.dart';
import 'package:news_app/components/ChoiceButton.dart';
import 'package:news_app/components/CustomFormInput.dart';
import 'package:news_app/services/auth.service.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.kBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Icon(
              Icons.arrow_back,
              color: AppTheme.kPrimaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/register.svg',
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create an account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomFormInput(
                    label: 'Enter your email',
                    hintText: 'Your email',
                    obscure: false,
                    controller: emailController),
                SizedBox(
                  height: 30,
                ),
                CustomFormInput(
                    label: 'Enter your password',
                    hintText: 'Your password',
                    obscure: true,
                    controller: passwordController),
                SizedBox(
                  height: 30,
                ),
                ChoiceButton(
                    label: "Create account",
                    press: () async {
                      String result = await AuthService()
                          .signUpWithEmailAndPassword(
                              emailController.value.text,
                              passwordController.value.text);

                      if (result != "OK") {
                        displaySnackBar(
                            context: context, text: result, color: Colors.red);
                      } else {
                        // navigate to logged in
                      }
                    },
                    isFilled: true,
                    width: 1),
                SizedBox(
                  height: 30,
                ),
                ChoiceButton(
                    label: "Sign up with Google",
                    press: () async {
                      bool result = await AuthService().signInWithGoogle();

                      if (!result) {
                        displaySnackBar(
                            context: context,
                            text: 'Could not proceed',
                            color: Colors.red);
                      } else {
                        // navigate to signed in screen
                      }
                    },
                    isFilled: false,
                    width: 1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
