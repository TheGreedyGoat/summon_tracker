import 'package:flutter/material.dart';
import 'package:summon_tracker/test_widgets.dart/replace_expressions_test.dart';
import 'package:summon_tracker/test_widgets.dart/variables_test.dart';

class VarAndReplaceTest extends StatelessWidget {
  const VarAndReplaceTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [VariablesTest(), ReplaceExpressionsTest()]);
  }
}
