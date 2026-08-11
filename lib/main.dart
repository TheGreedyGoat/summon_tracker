import 'package:summon_tracker/models/free_text.dart';
import 'package:summon_tracker/models/simple_die_expression.dart';

void main() {
  // runTestApp();
  final txt = FreeText(
    raw:
        'Bite: Melee Weapon Attack: +[SCA] to hit, reach 5 ft., one target. Hit: {[2d6] + 3} slashing damage plus [1d6] acid damage. If the target is a Large or smaller creature, it is grappled (escape DC {[SSDC] + 3}). Until this grapple ends, the ankheg can bite only the grappled creature and has advantage on attack rolls to do so.',
  );
  print(txt.variables);
  print(txt.expressions);
  print(txt.diceExp);
}

void _testStatRegexp() {}
