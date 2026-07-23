import 'package:flutter/material.dart';
import 'package:summon_tracker/insert_string.dart';

class ReplaceExpressionsTest extends StatefulWidget {
  const ReplaceExpressionsTest({super.key});

  @override
  State<ReplaceExpressionsTest> createState() => _ReplaceExpressionsTestState();
}

class _ReplaceExpressionsTestState extends State<ReplaceExpressionsTest> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 500,
          height: 400,

          child: TextField(
            maxLines: 5,
            controller: _controller,
            onChanged: (value) => setState(() {}),
          ),
        ),
        SizedBox(
          width: 500,
          height: 400,
          child: DecoratedBox(
            decoration: BoxDecoration(border: BoxBorder.all()),
            child: Text(replaceExpressions(_controller.text)),
          ),
        ),
      ],
    );
  }
}
