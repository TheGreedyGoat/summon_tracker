import 'package:flutter/material.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      width: double.infinity,
      child: DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
    );
  }
}
