import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          // backgroundColor:
          //     Theme.of(context).elevatedButtonTheme.style.backgroundColor,
          // foregroundColor: textColor ??
          //     Theme.of(context).elevatedButtonTheme.style?.foregroundColor,
          ),
      child: Text(text),
    );
  }
}
