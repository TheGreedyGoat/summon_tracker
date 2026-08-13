import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/models/free_text.dart';
import 'package:summon_tracker/widget_tree.dart';

final txt = '''
. Melee Weapon Attack: +[lvl] to hit, reach 5 ft., 
one target. Hit: {2d6 + 3 + [lvl]} slashing damage plus 1d6
 acid damage. If the target is a Large or smaller creature, it is grappled 
(escape DC 13). Until this grapple ends, 
the ankheg can bite only the grappled creature and has 
advantage on attack rolls to do so.

''';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(child: MaterialApp(home: WidgetTree())),
  );

  // final FreeText xyz = FreeText(raw: txt);

  // print(xyz.evaluate({}));
}
