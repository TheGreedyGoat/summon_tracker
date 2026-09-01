import 'package:flutter_test/flutter_test.dart';
import 'package:summon_tracker/logic/models/simple_die_expression.dart';

void main() {
  group(
    'Die Expression basics:\n',
    () {
      test(
        'Averages are calculated correctly',
        () {
          for (final sides in [4, 6, 8, 10, 12, 20, 100]) {
            for (int diceCount = 1; diceCount < 10; diceCount++) {
              final dice = SimpleDieExpression(
                diceCount: diceCount,
                sides: sides,
              );
              expect(dice.average, equals(diceCount * (sides / 2 + 0.5)));
            }
          }
        },
      );

      test(
        'Dice String Parsing with small and capital d',
        () {
          for (final sides in [4, 6, 8, 10, 12, 20, 100]) {
            for (int diceCount = 1; diceCount < 10; diceCount++) {
              final diceString = '${diceCount}d$sides';
              final diceStringCap = '${diceCount}D$sides';
              final exp = SimpleDieExpression.fromString(diceString);
              final expCap = SimpleDieExpression.fromString(diceStringCap);
              expect(exp, equals(expCap));
              SimpleDieExpression? wrongExp;
              try {
                wrongExp = SimpleDieExpression.fromString('2f8');
              } catch (e) {
                wrongExp = null;
              }
              expect(wrongExp, equals(null));
            }
          }
        },
      );
    },
  );
}
