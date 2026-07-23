import 'package:flutter/material.dart';
import 'package:summon_tracker/test_widgets.dart/add_variable.dart';
import 'package:summon_tracker/test_widgets.dart/variables_test_line.dart';
import 'package:summon_tracker/variables.dart';

class VariablesTest extends StatefulWidget {
  const VariablesTest({super.key});

  @override
  State<VariablesTest> createState() => _VariablesTestState();
}

class _VariablesTestState extends State<VariablesTest> {
  @override
  Widget build(BuildContext context) {
    List<Variable> variables = VariableService.instance.all;

    return Column(
      children: [
        ...variables.map(
          (v) =>
              VariablesTestLine(variable: v, onChanged: () => setState(() {})),
        ),
        AddVariable(onChanged: () => setState(() {})),
      ],
    );
  }
}
