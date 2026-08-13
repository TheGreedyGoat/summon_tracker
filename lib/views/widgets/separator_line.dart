import 'package:flutter/material.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 2,
        width: double.infinity,
        child: DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
      ),
    );
  }
}
