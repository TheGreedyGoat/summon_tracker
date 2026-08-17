import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/skill.dart';
import 'package:summon_tracker/models/damage_mod.dart';

part 'ability.freezed.dart';

class Ability {
  final String longName;
  final String short;

  Ability({required this.longName, required this.short});

  @override
  bool operator ==(Object other) =>
      other is Ability && other.longName == longName;

  @override
  int get hashCode => Object.hash('ability', longName);
}

@freezed
class AbilityScore with _$AbilityScore {
  @override
  final Ability ability;
  @override
  final String score;
  @override
  final Proficiency proficiency;

  AbilityScore({
    required this.ability,
    required this.score,
    required this.proficiency,
  });
}

enum CoreAbility {
  str(long: 'Strength', short: 'STR'),
  dex(long: 'Dexterity', short: 'DEX'),
  con(long: 'Constitution', short: 'CON'),
  int(long: 'Intelligence', short: 'INT'),
  wis(long: 'Wisdom', short: 'WIS'),
  cha(long: 'Charisma', short: 'CHA');

  final String long;
  final String short;

  Ability get ability => Ability(longName: long, short: short);

  const CoreAbility({required this.long, required this.short});
}
