import 'package:flutter/material.dart';

class CustomFormInput extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  final Color? color;

  CustomFormInput(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.obscure,
      required this.controller,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              isDense: true,
              filled: true,
              fillColor:
                  color ?? Theme.of(context).accentColor.withOpacity(0.2),
              contentPadding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
              hintText: hintText,
              counterStyle: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
