import 'package:flutter/material.dart';
import 'package:math_parser/math_parser.dart';
import 'package:summon_tracker/stat_expression.dart';
import 'package:summon_tracker/summon.dart';
import 'package:summon_tracker/test_widgets.dart/separator_line.dart';

class SummonDisplayCalced extends StatelessWidget {
  final SummonData summonData;
  final Map<String, int> variables;
  const SummonDisplayCalced({
    required this.summonData,
    required this.variables,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool fullVariables = true;
    for (final tag in summonData.variableTags) {
      if (!variables.containsKey(tag)) {
        fullVariables = false;
      }
    }
    return fullVariables
        ? Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('HP: ${calc(summonData.hitPoints)}'),
                  Text('AC: ${calc(summonData.armorClass)}'),
                ],
              ),
              SeparatorLine(),
              Row(
                spacing: 5,
                children: [
                  Column(
                    children: [
                      Text('STR'),
                      Text(calc(summonData.strength).toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text('DEX'),
                      Text(calc(summonData.dexterity).toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text('CON'),
                      Text(calc(summonData.constitution).toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text('INT'),
                      Text(calc(summonData.intelligence).toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text('WIS'),
                      Text(calc(summonData.wisdom).toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text('CHA'),
                      Text(calc(summonData.charisma).toString()),
                    ],
                  ),
                ],
              ),
              SeparatorLine(),
              Column(
                children: [
                  // prof
                  Text('proficiency bonus: ${calc(summonData.proficiency)}'),
                ],
              ),
            ],
          )
        : Text('Fehler!');
  }

  int calc(StatExpression exp) {
    final node = MathNodeExpression.fromString(
      exp.expression,
      variableNames: summonData.variableTags,
    );
    return node.calc(MathVariableValues(variables)) as int;
  }
}
