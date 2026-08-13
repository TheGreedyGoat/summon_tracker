import 'package:freezed_annotation/freezed_annotation.dart';

part 'rulebook.freezed.dart';

enum Proficiency {
  none(0),
  proficiency(1),
  expertise(2);

  String get long => '${name[0].toUpperCase()}${name.substring(1)}';
  String get short => long.substring(0, 4);
  final int profMultipilier;
  const Proficiency(this.profMultipilier);
}

enum DamageMod {
  none(1),
  vulnerable(2),
  resistant(0.5),
  immune(0);

  final double multiplier;
  String get long => '${name[0].toUpperCase()}${name.substring(1)}';
  String get short => long.substring(0, 4);
  int calcDamage(int damage) => (damage * multiplier).floor();
  const DamageMod(this.multiplier);
}

enum BaseDamageType {
  bludgeoning(long: 'Bludgeoning', short: 'Blud'),
  piercing(long: 'Piercing', short: 'Pier'),
  slashing(long: 'Slashing', short: 'Slash'),
  acid(long: 'Acid', short: 'Acid'),
  cold(long: 'Cold', short: 'Cold'),
  fire(long: 'Fire', short: 'Fire'),
  force(long: 'Force', short: 'Force'),
  lightning(long: 'Lightning', short: 'Light'),
  necrotic(long: 'Necrotic', short: 'Nec'),
  poison(long: 'Poison', short: 'Poison'),
  psychic(long: 'Psychic', short: 'Psych'),
  radiant(long: 'Radiant', short: 'Rad'),
  thunder(long: 'Thunder', short: 'Thund');

  bool get isPhysical =>
      this == bludgeoning || this == piercing || this == slashing;
  final String long;
  final String short;
  const BaseDamageType({required this.long, required this.short});
}

enum Ability {
  str(long: 'Strength', short: 'STR'),
  dex(long: 'Dexterity', short: 'DEX'),
  con(long: 'Constitution', short: 'CON'),
  int(long: 'Intelligence', short: 'INT'),
  wis(long: 'Wisdom', short: 'WIS'),
  cha(long: 'Charisma', short: 'CHA');

  final String long;
  final String short;

  const Ability({required this.long, required this.short});
}

enum BaseSkill {
  acrobatics(ability: Ability.dex, long: 'Acrobatics', short: 'Acro'),
  animalHandling(
    ability: Ability.wis,
    long: 'Animal Handling',
    short: 'AniHan',
  ),
  arcana(ability: Ability.int, long: 'Arcana', short: 'Arc'),
  athletics(ability: Ability.str, long: 'Athletics', short: 'Ath'),
  deception(ability: Ability.cha, long: 'Deception', short: 'Dec'),
  history(ability: Ability.int, long: 'History', short: 'Hist'),
  insight(ability: Ability.wis, long: 'Insight', short: 'Ins'),
  intimidation(ability: Ability.cha, long: 'Intimidation', short: 'Intim'),
  investigation(ability: Ability.int, long: 'Investigation', short: 'Inv'),
  medicine(ability: Ability.wis, long: 'Medicine', short: 'Med'),
  nature(ability: Ability.int, long: 'Nature', short: 'Nat'),
  perception(ability: Ability.wis, long: 'Perception', short: 'Perc'),
  performance(ability: Ability.cha, long: 'Performance', short: 'Perf'),
  persuasion(ability: Ability.cha, long: 'Persuasion', short: 'Pers'),
  religion(ability: Ability.int, long: 'Religion', short: 'Rel'),
  sleightOfHand(
    ability: Ability.dex,
    long: 'Sleight of Hand',
    short: 'Sleig',
  ),
  stealth(ability: Ability.dex, long: 'Stealth', short: 'Steal'),
  survival(ability: Ability.wis, long: 'Survival', short: 'Surv');

  final Ability ability;
  final String long;
  final String short;
  const BaseSkill({
    required this.ability,
    required this.long,
    required this.short,
  });
}

@freezed
class AbilityScoreString with _$AbilityScoreString {
  final Ability ability;
  final String score;
  final bool saveProficient;

  AbilityScoreString({
    required this.ability,
    required this.score,
    required this.saveProficient,
  });
}

@freezed
class SkillProficiency with _$SkillProficiency {
  final String skillName;
  final Proficiency prof;

  SkillProficiency({required this.skillName, required this.prof});
}

@freezed
class DamageModifier with _$DamageModifier {
  final String damageType;
  final DamageMod damageMod;

  const DamageModifier({required this.damageType, required this.damageMod});
}

@freezed
class ActionAbility with _$ActionAbility {
  final String name;
  final String description;

  ActionAbility({required this.name, required this.description});
}
