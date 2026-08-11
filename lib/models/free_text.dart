import 'package:summon_tracker/models/simple_die_expression.dart';
import 'package:summon_tracker/services/expression_service.dart';

/// Text that can contain expressions wich can be evaluated and replaced
class FreeText {
  final String raw;

  /// Text that can contain expressions wich can be evaluated and replaced
  FreeText({required this.raw});

  /// extracts all tagged expression from raw
  List<String> get expressions => ExpressionService.scanForExpressions(raw);

  /// extracts all variables
  Set<String> get variables => ExpressionService.scanForVariables(raw).toSet();

  List<String> get diceExp => ExpressionService.sanForDiceExpressions(raw);

  String fillInVariables(Map<String, int> values) {
    return values.keys.fold(
      raw,
      (previousValue, varKey) =>
          previousValue.replaceAll(varKey, values[varKey].toString()),
    );
  }

  String evaluate(Map<String, int> values) {
    final filledIn = fillInVariables(values);

    return 'lalala';
  }
}
