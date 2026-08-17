import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_parser/math_parser.dart';
import 'package:summon_tracker/services/expression_service.dart';
part 'numeric_expression.freezed.dart';

@freezed
class NumericExpression with _$NumericExpression {
  final String raw;
  const NumericExpression._({
    required this.raw,
  });

  static NumericExpression? tryParse(
    String expression,
  ) {
    final exp = NumericExpression._(
      raw: expression,
    );

    return exp.isValid ? exp : null;
  }

  NumericExpression.constant(int value, String? name)
    : this._(
        raw: value.toString(),
      );

  bool get isValid {
    try {
      MathNodeExpression.fromString(
        getFilledIn(null, true),
      ).calc(MathVariableValues.none);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Set<String> get variableTags {
    return ExpressionService.scanForVariables(raw).toSet();
  }

  String getFilledIn([Map<String, int>? variableValues, bool insert1 = false]) {
    String exp = raw.toString();
    for (final varTag in variableTags) {
      exp = exp.replaceAll(
        varTag,
        (variableValues?[varTag] ?? (insert1 ? 1 : varTag)).toString(),
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
  String toString() => raw;
}

class MissingVariableException implements Exception {
  final String variableName;

  MissingVariableException([
    this.variableName = 'x',
  ]);

  @override
  String toString() => 'No value provided for variable tag $variableName';
}
