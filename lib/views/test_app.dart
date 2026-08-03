import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/views/pages/summons_overview.dart';
import 'package:summon_tracker/widget_tree.dart';

void runTestApp() {
  // SummonTemplate(
  //   name: 'Harald',
  //   hitPoints: StatExpression.tryParse('[Level] * [avg] + [CON]')!,
  //   armorClass: StatExpression.tryParse('14')!,
  //   strength: StatExpression.tryParse('[X] + 6', name: 'STR')!,
  //   dexterity: StatExpression.tryParse('10', name: 'DEX')!,
  //   constitution: StatExpression.tryParse('[X]', name: 'CON')!,
  //   intelligence: StatExpression.tryParse('12', name: 'INT')!,
  //   wisdom: StatExpression.tryParse('8', name: 'WIS')!,
  //   charisma: StatExpression.tryParse('[Y]', name: 'CHA')!,
  //   proficiency: StatExpression.tryParse('5')!,
  // );
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: WidgetTree(),
      ),
    ),
  );
}
