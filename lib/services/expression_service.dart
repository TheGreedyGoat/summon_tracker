import 'package:summon_tracker/models/simple_die_expression.dart';

/// static class to handle mathematical expressions including veriables, dice expressions etc.
class ExpressionService {
  static const _varTagRegexp = r'\[.[^[\]]+\]';
  static const _expTagRegexp = r'\{.[^{\}]+\}';
  static const _invalidvatTagRegexp = r'\[.[^]]*\[.[^[]*]';

  /// A regular expression to detect tagged variables eg [DEX]
  static RegExp get varTagReg => RegExp(_varTagRegexp);

  /// A regular expression to detect tagged expressions eg {[DEX] + 3}
  static RegExp get expTagReg => RegExp(_expTagRegexp);

  /// WIP a regular expression to detect faulty regexp;
  static RegExp get invalidTagReg => RegExp(_invalidvatTagRegexp);

  /// extracts all tagged expressions from [raw] eg {[DEX] + 3}
  static List<String> scanForExpressions(String raw) => scanFor(
    raw,
    reg: expTagReg,
  );

  /// extracts all tagged variables from [raw] eg [DEX] not including dice expressions
  static List<String> scanForVariables(String raw) => scanFor(
    raw,
    reg: varTagReg,
    where: (exp) =>
        SimpleDieExpression.tryParse(exp.substring(1, exp.length - 1)) == null,
  );

  static List<String> sanForDiceExpressions(String raw) => scanFor(
    raw,
    reg: varTagReg,
    where: (e) =>
        SimpleDieExpression.tryParse(e.substring(1, e.length - 1)) != null,
  );

  static List<String> scanFor(
    String raw, {
    required RegExp reg,
    bool Function(String e)? where,
  }) => reg
      .allMatches(raw)
      .map(
        (match) {
          final start = match.start;
          final end = match.end;
          return raw.substring(start, end);
        },
      )
      .where(
        (exp) => where?.call(exp) ?? true,
      )
      .toList();

  /// Simplyfies a mathematical expression
  ///
  /// solves brackets recursively as much as possible and then combines any constant values
  static String simplify(String expression) {
    expression = expression.replaceAll(' ', '');
    String bracketsResolved = expression.toString();

    int depth = 0;
    int firstOpenIndex = -1;
    for (int i = 0; i < expression.length; i++) {
      final currentChar = expression[i];
      if (currentChar == '(') {
        depth++;
        // if an outer bracket has opened
        if (depth == 1) {
          firstOpenIndex = i;
        }
      } else if (currentChar == ')') {
        depth--;

        // if an outer bracket has closed
        if (depth == 0) {
          final bracket = expression.substring(firstOpenIndex, i + 1);
          final subTerm = bracket.substring(1, bracket.length - 1);
          // print(subTerm);

          final simplifiedTerm = simplify(subTerm);
          final number = num.tryParse(simplifiedTerm);

          // If a single number is returned, discard the brackets. keep them else
          bracketsResolved = bracketsResolved.replaceAll(
            bracket,
            number == null ? '($simplifiedTerm)' : simplifiedTerm,
          );
        }
      }
    }
    String simplyfied = _sumConstantsOutsideParentheses(
      bracketsResolved,
    );
    // remove leading +
    if (simplyfied.startsWith('+')) {
      simplyfied = simplyfied.substring(1);
    }
    //
    simplyfied = simplyfied.replaceAll(RegExp(r'(?<=[0-9])\*|\*(?=[0-9])'), '');
    return simplyfied;
  }

  static String _sumConstantsOutsideParentheses(String expression) {
    // cancel out any multiplication by 1;
    expression = expression.replaceAll(
      RegExp(r'(?<=[^0-9]|^)1\*|\*1(?=[^0-9]|$)'),
      '',
    );
    final Map<String, String> brackets = {};
    String result = '';

    for (int i = 0; i < expression.length; i++) {
      final currentChar = expression[i];
      // Skip brackets
      if (currentChar == '(') {
        int depth = 1;
        for (int j = i + 1; j < expression.length; j++) {
          final jChar = expression[j];
          if (jChar == '(') {
            depth++;
            continue;
          }
          if (jChar == ')') {
            depth--;
            if (depth == 0) {
              final key = '#' * (brackets.keys.length + 1);
              brackets[key] = expression.substring(i, j + 1);
              result += key;
              i = j;
              break;
            }
          }
        }
      } else {
        result += currentChar;
      }
    }
    final replaced = result.replaceAll('-+', '-').replaceAll('-', '+-');
    final summands = replaced.split('+');
    //
    final newSummands = summands.toList();
    num sum = 0;
    for (int i = 0; i < summands.length; i++) {
      final s = summands[i];
      if (!s.contains(RegExp(r'-?\d+(\*\d+)*$'))) continue;
      num value = 1;
      final multis = s.split('*');
      for (final m in multis) {
        value *= num.tryParse(m) ?? 1;
      }
      sum += value;
      newSummands.remove(s);
    }
    if (sum != 0) {
      newSummands.add(sum.toString());
    }
    String folded = newSummands.fold<String>(
      '',
      (previousValue, element) {
        element = brackets.keys.contains(element)
            ? brackets[element]!
            : element;
        return '$previousValue${element.isNotEmpty ? '+$element' : ''}';
      },
    );
    folded = folded.replaceAll('+-', '-');
    for (final key in brackets.keys) {
      folded = folded.replaceAll(
        RegExp(r'(?<=[^#])' + key + r'(?=[^#])'),
        brackets[key]!,
      );
    }

    return folded;
  }

  /// returns the average roll of a die that has the passed number of sides
  static double averageDie(int sides) => sides / 2 + 0.5;

  /// takes in an expression containing constants and die expressions only
  static int averageExpression(String expression) {
    return 1;
  }
}
