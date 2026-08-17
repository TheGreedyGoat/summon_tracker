import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/ability.dart';
import 'package:summon_tracker/models/damage_mod.dart';

part 'skill.freezed.dart';

enum CoreSkill {
  acrobatics(ability: CoreAbility.dex, long: 'Acrobatics', short: 'Acro'),
  animalHandling(
    ability: CoreAbility.wis,
    long: 'Animal Handling',
    short: 'AniHan',
  ),
  arcana(ability: CoreAbility.int, long: 'Arcana', short: 'Arc'),
  athletics(ability: CoreAbility.str, long: 'Athletics', short: 'Ath'),
  deception(ability: CoreAbility.cha, long: 'Deception', short: 'Dec'),
  history(ability: CoreAbility.int, long: 'History', short: 'Hist'),
  insight(ability: CoreAbility.wis, long: 'Insight', short: 'Ins'),
  intimidation(ability: CoreAbility.cha, long: 'Intimidation', short: 'Intim'),
  investigation(ability: CoreAbility.int, long: 'Investigation', short: 'Inv'),
  medicine(ability: CoreAbility.wis, long: 'Medicine', short: 'Med'),
  nature(ability: CoreAbility.int, long: 'Nature', short: 'Nat'),
  perception(ability: CoreAbility.wis, long: 'Perception', short: 'Perc'),
  performance(ability: CoreAbility.cha, long: 'Performance', short: 'Perf'),
  persuasion(ability: CoreAbility.cha, long: 'Persuasion', short: 'Pers'),
  religion(ability: CoreAbility.int, long: 'Religion', short: 'Rel'),
  sleightOfHand(
    ability: CoreAbility.dex,
    long: 'Sleight of Hand',
    short: 'Sleig',
  ),
  stealth(ability: CoreAbility.dex, long: 'Stealth', short: 'Steal'),
  survival(ability: CoreAbility.wis, long: 'Survival', short: 'Surv');

  final CoreAbility ability;
  final String long;
  final String short;
  const CoreSkill({
    required this.ability,
    required this.long,
    required this.short,
  });
}

@freezed
class SkillProficiency with _$SkillProficiency {
  final String skillName;
  final Proficiency prof;

  SkillProficiency({required this.skillName, required this.prof});
}

enum Proficiency {
  none(0),
  proficiency(1),
  expertise(2);

  String get long => '${name[0].toUpperCase()}${name.substring(1)}';
  String get short => long.substring(0, 4);
  final int profMultipilier;
  const Proficiency(this.profMultipilier);
}
