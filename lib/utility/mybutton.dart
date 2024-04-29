import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
