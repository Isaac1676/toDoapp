import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  final bool isTrue;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isTrue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: MaterialButton(
        onPressed: onPressed,
        color: isTrue ? Colors.indigo : Colors.white,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isTrue ? Colors.white : Colors.indigo,
              fontFamily: "Rubik",
            ),
          ),
        ),
      ),
    );
  }
}
