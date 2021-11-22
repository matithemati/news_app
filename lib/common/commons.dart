import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displaySnackBar(
    {required BuildContext context,
    required String text,
    required Color color}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
