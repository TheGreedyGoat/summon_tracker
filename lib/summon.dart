import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/stat_expression.dart';

part 'summon.freezed.dart';

@freezed
class SummonData with _$SummonData {
  final StatExpression hitPoints;
  final StatExpression armorClass;
  final StatExpression strength;
  final StatExpression dexterity;
  final StatExpression constitution;
  final StatExpression intelligence;
  final StatExpression wisdom;
  final StatExpression charisma;
  final StatExpression proficiency;
  SummonData({
    required this.hitPoints,
    required this.armorClass,
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
    required this.proficiency,
  });

  List<StatExpression> toList() {
    return [
      hitPoints,
      armorClass,
      strength,
      dexterity,
      constitution,
      intelligence,
      wisdom,
      charisma,
      proficiency,
    ];
  }

  Set<String> get variableTags {
    return toList().expand((stat) => stat.getVariableTags()).toSet();
  }
}
