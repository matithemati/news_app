import 'package:flutter/material.dart';
import 'package:news_app/common/theme.dart';
import 'package:news_app/screens/Entry.screen.dart';
import 'package:news_app/screens/SignIn.screen.dart';
import 'package:news_app/screens/SignUp.screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.kTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => EntryScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/signIn': (context) => SignInScreen(),
      },
    );
  }
}
