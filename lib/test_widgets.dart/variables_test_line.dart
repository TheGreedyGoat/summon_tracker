import 'package:flutter/material.dart';
import 'package:summon_tracker/variables.dart';

class VariablesTestLine extends StatefulWidget {
  final Variable variable;
  final void Function() onChanged;
  const VariablesTestLine({
    required this.variable,
    required this.onChanged,
    super.key,
  });

  @override
  State<VariablesTestLine> createState() => _VariablesTestLineState();
}

class _VariablesTestLineState extends State<VariablesTestLine> {
  late final TextEditingController nameController;
  late final TextEditingController valueController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.variable.name);
    valueController = TextEditingController(
      text: widget.variable.value.toString(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    valueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.variable.tag),
        SizedBox.square(dimension: 20),
        SizedBox(
          width: 60,
          child: TextField(
            controller: nameController,
            onChanged: (value) {
              setState(() {
                VariableService.instance.updateVariable(
                  widget.variable.tag,
                  name: value,
                );
                widget.onChanged();
              });
            },
          ),
        ),
        SizedBox.square(dimension: 20),
        SizedBox(
          width: 60,
          child: TextField(
            controller: valueController,
            onChanged: (value) {
              setState(() {
                VariableService.instance.updateVariable(
                  widget.variable.tag,
                  value: int.tryParse(value),
                );
                widget.onChanged();
              });
            },
          ),
        ),
        Text(widget.variable.toString()),
      ],
    );
  }
}
