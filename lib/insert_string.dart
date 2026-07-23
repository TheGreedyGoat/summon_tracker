import 'package:math_parser/math_parser.dart';
import 'package:summon_tracker/variables.dart';

final dexTag = 'DEX';
final profTag = 'Prof';
final rangeTag = 'rng';
final variables = <String, int>{dexTag: 5, profTag: 3, rangeTag: 5};

String x =
    'Melee Weapon attack. +<[$dexTag] + [$profTag] * t> to hit., reach <[$rangeTag] + 6> ft., 1 target...';

String replaceExpressions(String data) {
  for (int i = data.length - 1; i >= 0; i--) {
    if (data[i] == '>') {
      int j = i - 1;
      for (; j >= 0; j--) {
        if (data[j] == '<') {
          final tagged = data.substring(j, i + 1);
          final extracted = data.substring(j + 1, i);
          data = data.replaceRange(j, i + 1, evaluateExpression(extracted));
          break;
        }
      }
      i = j;
    }
  }
  return data;
}

Set<String> parseVariableTags(String data) {
  Set<String> result = {};
  for (int i = 0; i < data.length; i++) {
    if (data[i] == '[') {
      int j = i + 1;
      for (; j < data.length; j++) {
        if (data[j] == ']') {
          result.add(data.substring(i + 1, j));
          break;
        }
      }
      i = j;
    }
  }
  return result;
}

String evaluateExpression(String data) {
  String dCopy = data;
  final variableTags = parseVariableTags(data);
  try {
    final Map<String, int> variables = VariableService.instance.getVariables(
      variableTags.toList(),
    );
    for (final tag in variables.keys) {
      dCopy = dCopy.replaceAll('[$tag]', variables[tag]!.toString());
    }
    return MathNodeExpression.fromString(
      dCopy,
    ).calc(MathVariableValues.none).toString();
  } catch (e) {
    print('Error evaluating expression: $e');
    return '<$data>';
  }
}

void foo() {
  VariableService.instance.addVariable('Dex Bonus', dexTag, 5);
  VariableService.instance.addVariable('Prof Bonus', profTag, 3);
  VariableService.instance.addVariable('Range', rangeTag, 5);

  replaceExpressions(x);
}
