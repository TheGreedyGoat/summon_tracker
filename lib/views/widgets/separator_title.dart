import 'package:flutter/material.dart';
import 'package:summon_tracker/views/widgets/separator_line.dart';

class SeparatorTitle extends StatelessWidget {
  final double fontSize;
  final String title;
  final Widget? trailing;
  const SeparatorTitle({
    super.key,
    required this.title,
    this.fontSize = 20,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: fontSize),
            ),
            trailing ?? Container(),
          ],
        ),
        SeparatorLine(),
      ],
    );
  }
}
