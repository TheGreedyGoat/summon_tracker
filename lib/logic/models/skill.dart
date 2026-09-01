import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/logic/models/ability.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';

part 'skill.freezed.dart';

enum CoreSkill {
  acrobatics(ability: Ability.dex, long: 'Acrobatics'),
  animalHandling(ability: Ability.wis, long: 'Animal Handling'),
  arcana(ability: Ability.int, long: 'Arcana'),
  athletics(ability: Ability.str, long: 'Athletics'),
  deception(ability: Ability.cha, long: 'Deception'),
  history(ability: Ability.int, long: 'History'),
  insight(ability: Ability.wis, long: 'Insight'),
  intimidation(ability: Ability.cha, long: 'Intimidation'),
  investigation(ability: Ability.int, long: 'Investigation'),
  medicine(ability: Ability.wis, long: 'Medicine'),
  nature(ability: Ability.int, long: 'Nature'),
  perception(ability: Ability.wis, long: 'Perception'),
  performance(ability: Ability.cha, long: 'Performance'),
  persuasion(ability: Ability.cha, long: 'Persuasion'),
  religion(ability: Ability.int, long: 'Religion'),
  sleightOfHand(ability: Ability.dex, long: 'Sleight of Hand'),
  stealth(ability: Ability.dex, long: 'Stealth'),
  survival(ability: Ability.wis, long: 'Survival');

  final Ability ability;
  final String long;

  Skill get skill => Skill(name: long, ability: ability);
  const CoreSkill({
    required this.ability,
    required this.long,
  });
}

class Skill {
  final String name;
  final Ability ability;

  Skill({required this.name, required this.ability});
}

@freezed
class SkillProficiency with _$SkillProficiency {
  final Skill skill;
  final Proficiency prof;

  SkillProficiency({required this.skill, required this.prof});
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
