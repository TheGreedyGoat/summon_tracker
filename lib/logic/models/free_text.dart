import 'package:math_parser/math_parser.dart';
import 'package:summon_tracker/logic/models/simple_die_expression.dart';
import 'package:summon_tracker/logic/services/expression_service.dart';
import 'package:uuid/uuid.dart';

/// Text that can contain expressions wich can be evaluated and replaced
class FreeText {
  final String raw;

  /// Text that can contain expressions wich can be evaluated and replaced
  FreeText({required this.raw});

  /// extracts all tagged expression from raw
  List<String> get expressions => ExpressionService.scanForExpressions(raw);

  /// extracts all variables
  Set<String> get variableTags =>
      ExpressionService.scanForVariables(raw).toSet();

  /// extracts all dice expressions
  List<String> get diceExp => ExpressionService.scanForDiceThrows(raw);

  String fillInVariables(Map<String, int> values) => values.keys.fold(
    raw,
    (previousValue, varKey) =>
        previousValue.replaceAll(varKey, values[varKey].toString()),
  );

  /// - Replaces variable tags with corresponding values if present in [values]
  /// - simplifies all expressions as much as possible
  /// - converts all expressions containing dice throws to average(dice Expression) notation (eg {1d6 + 1 + 2} 6(1d6 + 3))
  String evaluate(Map<String, int> values) {
    String filledIn = fillInVariables(values);
    //? =======dice in expressions=======
    // every {...} expression containing at least 1 die exp
    final withDice =
        ExpressionService.scanForExpressions(
              filledIn,
            )
            .where(
              (exp) => ExpressionService.diceExpReg.hasMatch(exp),
            )
            .toList();

    // The average values of found expressions floored
    final averages = withDice.map(
      (exp) {
        final replaced = ExpressionService.replaceDiceWithAv(
          exp.substring(1, exp.length - 1),
        );
        try {
          return MathNodeExpression.fromString(
            replaced,
          ).calc(MathVariableValues.none).floor();
        } catch (e) {
          print(e);
          return exp;
        }
      },
    ).toList();

    Map<String, String> diceAveragePlaceHolders = {};
    filledIn = withDice.fold(
      filledIn,
      (previousValue, original) {
        final unBracketOriginal = original.substring(1, original.length - 1);

        String simplifiedOriginal = ExpressionService.simplify(
          ExpressionService.wrapDiceExpressions(unBracketOriginal),
        );
        final key = '§%' * (diceAveragePlaceHolders.length + 1);
        diceAveragePlaceHolders[key] = ExpressionService.unWrapDiceExpressions(
          simplifiedOriginal,
        );
        return previousValue.replaceFirst(
          original,
          '${averages[withDice.indexOf(original)].toString()}(${key})',
        );
      },
    );

    // All remaining {...} expressions
    filledIn = ExpressionService.scanForExpressions(filledIn).fold(
      filledIn,
      (previousValue, exp) {
        return previousValue.replaceFirst(
          exp,
          ExpressionService.simplify(exp.substring(1, exp.length - 1)),
        );
      },
    );
    filledIn = ExpressionService.scanForDiceThrows(filledIn).fold(
      filledIn,
      (previousValue, dThrow) {
        return previousValue.replaceFirst(
          dThrow,
          SimpleDieExpression.fromString(dThrow).toString(),
        );
      },
    );
    filledIn = diceAveragePlaceHolders.keys.fold(
      filledIn,
      (previousValue, key) {
        return previousValue.replaceFirst(key, diceAveragePlaceHolders[key]!);
      },
    );
    return filledIn;
  }

  @override
  String toString() => raw;
}
