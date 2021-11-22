import 'package:flutter/material.dart';
import 'package:news_app/components/ChoiceButton.dart';
import 'package:news_app/components/GreetingCarousel.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                GreetingCarousel(),
                Text(
                  "Please log in or register to continue",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ChoiceButton(
                        label: 'Sign up',
                        press: () {
                          Navigator.pushNamed(context, '/signUp');
                        },
                        isFilled: true,
                        width: 0.35),
                    SizedBox(
                      width: 30,
                    ),
                    ChoiceButton(
                        label: 'Sign in',
                        press: () {
                          Navigator.pushNamed(context, '/signIn');
                        },
                        isFilled: false,
                        width: 0.35),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
