import 'dart:math';

import 'package:summon_tracker/logic/services/expression_service.dart';

/// represents any number of dice all having the same number of sides
class SimpleDieExpression {
  /// The amount of dice (eg the 2 in 2d8)
  final int diceCount;

  /// The number of sides the dice have (eg the 8 in 2d8)
  final int sides;

  /// represents any number of dice all having the same number of sides
  ///
  /// [diceCount]d[sides]
  ///
  SimpleDieExpression({required this.diceCount, required this.sides});

  /// converts a classic die String to a DieExpression instance
  factory SimpleDieExpression.fromString(String exp) {
    exp = exp.toLowerCase();
    final values = exp.split('d');
    return SimpleDieExpression(
      diceCount: int.parse(values[0]),
      sides: int.parse(values[1]),
    );
  }

  static SimpleDieExpression? tryParse(String exp) {
    try {
      return SimpleDieExpression.fromString(exp);
    } catch (e) {
      return null;
    }
  }

  /// rolls the dice adding an optional bonus and returns the result
  int roll([int bonus = 0, int? seed]) {
    final rand = Random();
    int roll = bonus;
    for (int i = 0; i < diceCount; i++) {
      roll += rand.nextInt(sides) + 1;
    }
    return roll;
  }

  /// returns the average roll expected from rolling the dice
  double get average => (ExpressionService.averageDie(sides) * diceCount);

  /// returns returns the average roll expected from rolling the dice rounded to the next smallest int (conforming to rule books)
  int get averageFloor => average.floor();

  /// returns the floored average followed by the dieString in bracktes,
  @override
  String toString() => '$averageFloor(${toDieString()})';

  /// Adds or substracts a bonus to the roll and returns the resulting rulebook-String
  String toStringWithBonus(int bonus) =>
      '${averageFloor + bonus}(${toDieString()} ${bonus < 0 ? '-' : '+'} ${bonus.abs()})';

  /// converts the expression to a classic die expression
  String toDieString() => '$diceCount${'d'}$sides';

  @override
  bool operator ==(Object other) =>
      other is SimpleDieExpression &&
      other.diceCount == diceCount &&
      other.sides == sides;

  @override
  int get hashCode => diceCount ^ sides;
}
