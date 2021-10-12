import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    required this.padding,
    required this.icon,
    required this.onPressed,
    this.width,
    this.border,
    this.color,
    this.size,
  }) : super(key: key);

  // Variaveis
  final double padding;
  final Widget icon;
  final void Function() onPressed;
  final double? width;
  final BorderRadius? border;
  final Color? color;
  final double? size;

  // Outra forma de se fazer um botão circular usando o
  // Elevated Button
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: Container(
        height: size == null ? 40 : size,
        width: width == null
            ? 40
            : size == null
                ? width
                : size,
        child: InkWell(
          borderRadius: BorderRadius.circular(size == null ? 40 : size!),
          onTap: onPressed,
          child: Container(
            height: size == null ? 40 : size,
            width: size == null ? 40 : size,
            decoration: BoxDecoration(
                color:
                    color == null ? Color.fromARGB(255, 240, 240, 240) : color,
                borderRadius: border == null
                    ? BorderRadius.circular(size == null ? 40 : size!)
                    : border),
            child: icon,
          ),
        ),
      ),
    );
  }
}

// ElevatedButton(
//           onPressed: onPressed,
//           child: icon,
//           style: ElevatedButton.styleFrom(
//             alignment: Alignment.center,
//             shape: CircleBorder(),
//             elevation: 3,
//             padding: EdgeInsets.all(16),
//             shadowColor: Color.fromARGB(255, 60, 60, 60),
//             primary: Color.fromARGB(255, 245, 245, 245),
//           ),
//         ),