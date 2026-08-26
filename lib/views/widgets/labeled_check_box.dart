import 'package:flutter/material.dart';

class LabeledCheckBox extends StatefulWidget {
  final Widget? leftLabel;
  final Widget? rightLabel;
  final Widget? topLabel;
  final Widget? bottLabel;
  final bool initialValue;
  final bool tristate;
  final void Function(bool? value) onChanged;

  LabeledCheckBox({
    super.key,
    this.leftLabel,
    this.rightLabel,
    this.topLabel,
    this.bottLabel,
    required this.onChanged,
    this.tristate = false,
    this.initialValue = false,
  });

  @override
  State<LabeledCheckBox> createState() => _LabeledCheckBoxState();
}

class _LabeledCheckBoxState extends State<LabeledCheckBox> {
  late bool? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ?widget.topLabel,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?widget.leftLabel,
            Checkbox(
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                  widget.onChanged(value);
                });
              },
              tristate: widget.tristate,
            ),
            ?widget.rightLabel,
          ],
        ),
        ?widget.bottLabel,
      ],
    );
  }
}
