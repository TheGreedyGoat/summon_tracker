import 'package:flutter/material.dart';
import 'package:summon_tracker/stat_expression.dart';
import 'package:summon_tracker/summon.dart';
import 'package:summon_tracker/test_widgets.dart/fill_in_variables.dart';
import 'package:summon_tracker/test_widgets.dart/separator_line.dart';

class SummonDisplayTest extends StatefulWidget {
  final SummonData summonData;
  const SummonDisplayTest({required this.summonData, super.key});

  @override
  State<SummonDisplayTest> createState() => _SummonDisplayTestState();
}

class _SummonDisplayTestState extends State<SummonDisplayTest> {
  late SummonData summonData;

  late final TextEditingController hpController;

  @override
  void initState() {
    super.initState();
    summonData = widget.summonData;
    hpController = TextEditingController(text: summonData.hitPoints.expression);
  }

  @override
  void dispose() {
    hpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Text('HP:'),
                Expanded(child: TextField(controller: hpController)),
              ],
            ),
            Text('AC: ${summonData.armorClass}'),
          ],
        ),
        SeparatorLine(),
        Row(
          spacing: 5,
          children: [
            Column(
              children: [Text('STR'), Text(summonData.strength.toString())],
            ),
            Column(
              children: [Text('DEX'), Text(summonData.dexterity.toString())],
            ),
            Column(
              children: [Text('CON'), Text(summonData.constitution.toString())],
            ),
            Column(
              children: [Text('INT'), Text(summonData.intelligence.toString())],
            ),
            Column(children: [Text('WIS'), Text(summonData.wisdom.toString())]),
            Column(
              children: [Text('CHA'), Text(summonData.charisma.toString())],
            ),
          ],
        ),
        SeparatorLine(),
        Column(
          children: [
            // prof
            Text('proficiency bonus: ${summonData.proficiency}'),
          ],
        ),
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FillInVariables(summonData: summonData);
                },
              ),
            );
          },
          color: Colors.red,
          hoverColor: Colors.yellow,
          splashColor: Colors.green,
          child: Text('Summon'),
        ),
        MaterialButton(
          onPressed: () {
            final exp = hpController.text;
            summonData = summonData.copyWith(
              hitPoints: StatExpression(expression: exp, variableTags: []),
            );
          },
          color: Colors.red,
          hoverColor: Colors.yellow,
          splashColor: Colors.green,
          child: Text('Save'),
        ),
      ],
    );
  }
}
