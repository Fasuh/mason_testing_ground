import 'package:flutter/material.dart';

class AnyAnimatedButtonError extends StatelessWidget {
  final Color color;
  final EdgeInsets padding;

  const AnyAnimatedButtonError({
    Key? key,
    this.color = Colors.white,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Icon(
        Icons.close,
        color: color,
      ),
    );
  }
}
