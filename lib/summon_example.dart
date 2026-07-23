import 'package:summon_tracker/stat_expression.dart';
import 'package:summon_tracker/summon.dart';

final SummonData summonExample = SummonData(
  hitPoints: StatExpression(
    expression: '[Level] * [avg] + [CON] ',
    variableTags: [],
  ),
  armorClass: StatExpression(expression: '14', variableTags: []),
  strength: StatExpression(expression: '[X] + 6', variableTags: []),
  dexterity: StatExpression(expression: '10', variableTags: []),
  constitution: StatExpression(expression: '[X]', variableTags: []),
  intelligence: StatExpression(expression: '12', variableTags: []),
  wisdom: StatExpression(expression: '8', variableTags: []),
  charisma: StatExpression(expression: '[Y]', variableTags: []),
  proficiency: StatExpression(expression: '5', variableTags: []),
);
