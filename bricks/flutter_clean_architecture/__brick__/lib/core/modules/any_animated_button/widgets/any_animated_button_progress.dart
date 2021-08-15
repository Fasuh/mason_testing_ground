import 'package:flutter/material.dart';

class AnyAnimatedButtonProgress extends StatelessWidget {
  final Color color;
  final EdgeInsets padding;

  const AnyAnimatedButtonProgress({
    Key? key,
    this.color = Colors.white,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 3.0,
        ),
      ),
    );
  }
}
