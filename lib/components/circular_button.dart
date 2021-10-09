import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double padding;
  final Icon icon;
  final void Function() onPressed;
  const CircularButton({
    Key? key,
    required this.padding,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  // Outra forma de se fazer um botão circular usando o
  // Elevated Button
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: Container(
        height: 40,
        width: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          child: icon,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            elevation: 3,
            padding: EdgeInsets.all(16),
            shadowColor: Color.fromARGB(255, 60, 60, 60),
            primary: Color.fromARGB(255, 245, 245, 245),
          ),
        ),
      ),
    );
  }
}
