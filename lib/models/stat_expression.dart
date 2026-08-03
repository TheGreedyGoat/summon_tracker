import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_parser/math_parser.dart';
part 'stat_expression.freezed.dart';

@freezed
class StatExpression with _$StatExpression {
  final String expression;
  const StatExpression._({
    required this.expression,
  });

  static StatExpression? tryParse(
    String expression,
  ) {
    final exp = StatExpression._(
      expression: expression,
    );
    return exp.isValid ? exp : null;
  }

  StatExpression.constant(int value, String? name)
    : this._(
        expression: value.toString(),
      );

  bool get isValid {
    try {
      MathNodeExpression.fromString(
        getFilledIn(),
      ).calc(MathVariableValues({}));
      return true;
    } catch (e) {
      return false;
    }
  }

  Set<String> get variableTags {
    final re = RegExp(r'\[.{1,5}\]');
    final matches = re.allMatches(expression).map((match) {
      return expression.substring(match.start + 1, match.end - 1);
    });
    return matches.map((e) => e.toString()).toSet();
  }

  String getFilledIn([Map<String, int>? variableValues]) {
    String exp = expression.toString();
    for (final varTag in variableTags) {
      exp = exp.replaceAll(varTag, (variableValues?[varTag] ?? 1).toString());
    }
    return exp;
  }

  @override
  String toString() => expression;
}
