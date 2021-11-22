import 'package:flutter/material.dart';
import 'package:news_app/common/theme.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final VoidCallback press;
  final bool isFilled;
  final double width;

  const ChoiceButton(
      {Key? key,
      required this.label,
      required this.press,
      required this.isFilled,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isFilled ? AppTheme.kPrimaryColor : Colors.white,
            border: Border.all(width: 1, color: AppTheme.kPrimaryColor)),
        child: Text(
          label,
          style: TextStyle(
              color: isFilled ? Colors.white : AppTheme.kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
