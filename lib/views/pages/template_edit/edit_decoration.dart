import 'package:flutter/material.dart';

class EditWrapper extends StatelessWidget {
  final Widget child;
  const EditWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}

final editInputDecoration = InputDecoration();
