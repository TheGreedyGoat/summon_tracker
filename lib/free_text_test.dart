import 'package:summon_tracker/models/free_text.dart';

final _txt = '''
. Melee Weapon Attack: +[lvl] to hit, reach 5 ft., 
one target. Hit: {2d6 + 3 + [lvl]} slashing damage plus 1d6
 acid damage. If the target is a Large or smaller creature, it is grappled 
(escape DC 13). Until this grapple ends, 
the ankheg can bite only the grappled creature and has 
advantage on attack rolls to do so.

''';
void main() {
  final FreeText xyz = FreeText(raw: _txt);

  print(xyz.evaluate({}));
}
