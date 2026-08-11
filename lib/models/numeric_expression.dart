import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_expressions/math_expressions.dart';
part 'numeric_expression.freezed.dart';

@freezed
class NumericExpression with _$NumericExpression {
  final String expression;
  const NumericExpression._({
    required this.expression,
  });

  static NumericExpression? tryParse(
    String expression,
  ) {
    final exp = NumericExpression._(
      expression: expression,
    );

    return exp.isValid ? exp : null;
  }

  NumericExpression.constant(int value, String? name)
    : this._(
        expression: value.toString(),
      );

  bool get isValid {
    try {
      ExpressionParser p = GrammarParser();
      // ignore: unused_local_variable
      final Expression exp = p.parse(getFilledIn());

      return true;
    } on FormatException catch (e) {
      print(e);
      return false;
    }
  }

  Set<String> get variableTags {
    final re = RegExp(r'\[.{1,5}\]');
    final matches = re.allMatches(expression).map((match) {
      final substring = expression.substring(match.start + 1, match.end - 1);
      // print('StatExpression.variableTags: $substring');
      return substring;
    });
    return matches.map((e) => e.toString()).toSet();
  }

  Set<Variable> get variables {
    return variableTags
        .map(
          (tag) => Variable(tag),
        )
        .toSet();
  }

  String getFilledIn([Map<String, int>? variableValues]) {
    String exp = expression.toString();
    for (final varTag in variableTags) {
      exp = exp.replaceAll(
        '[$varTag]',
        (variableValues?[varTag] ?? 1).toString(),
      );
    }
    return exp;
  }

  int evaluate(Map<String, int> variableValues) {
    for (final v in variableTags) {
      if (!variableValues.keys.contains(v)) {
        throw (MissingVariableException(v));
      }
    }
    final filledIn = getFilledIn(variableValues);

    final parser = GrammarParser();
    final exp = parser.parse(filledIn);

    final ctxModel = ContextModel();

    final evaluator = RealEvaluator(ctxModel);

    return evaluator.evaluate(exp).floor();
  }

  @override
  String toString() => expression;
}

class MissingVariableException implements Exception {
  final String variableName;

  MissingVariableException([
    this.variableName = 'x',
  ]);

  @override
  String toString() => 'No value provided for variable name [$variableName]';
}
