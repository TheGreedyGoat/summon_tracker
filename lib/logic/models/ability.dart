import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/logic/models/numeric_expression.dart';
import 'package:summon_tracker/logic/models/skill.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';

part 'ability.freezed.dart';

/// An ability score representation using a String as the score. Score may not be evaluateable
@freezed
class AbilityScoreString with _$AbilityScoreString {
  @override
  final Ability ability;
  @override
  final String score;
  @override
  final Proficiency proficiency;

  /// An ability score representation using a String as the score. Score may not be evaluateable
  AbilityScoreString({
    required this.ability,
    required this.score,
    required this.proficiency,
  });

  /// returns a corresponding [AbilityScoreNum] if [score] is evaluateable
  AbilityScoreNum? get asNumeric {
    final score = NumericExpression.tryParse(this.score);
    return score == null
        ? null
        : AbilityScoreNum(
            ability: ability,
            score: score,
            proficiency: proficiency,
          );
  }
}

/// An ability score representation using a Num Exp as the score.
class AbilityScoreNum {
  final Ability ability;
  final NumericExpression score;
  final Proficiency proficiency;

  AbilityScoreNum({
    required this.ability,
    required this.score,
    required this.proficiency,
  });

  AbilityScoreString get asString => AbilityScoreString(
    ability: ability,
    score: score.raw,
    proficiency: proficiency,
  );
}

enum Ability {
  str(
    long: 'Strength',
  ),
  dex(
    long: 'Dexterity',
  ),
  con(
    long: 'Constitution',
  ),
  int(
    long: 'Intelligence',
  ),
  wis(
    long: 'Wisdom',
  ),
  cha(
    long: 'Charisma',
  );

  final String long;
  String get short => long.substring(0, 3).toUpperCase();

  const Ability({
    required this.long,
  });
}
