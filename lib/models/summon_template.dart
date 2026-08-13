import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/free_text.dart';
import 'package:summon_tracker/models/numeric_expression.dart';
import 'package:summon_tracker/services/rulebook.dart';
import 'package:summon_tracker/services/summon_service.dart';
import 'package:uuid/uuid.dart';

part 'summon_template.freezed.dart';

@freezed
class SummonTemplate with _$SummonTemplate {
  //General
  final String _id;
  String get id => _id;
  final String name;

  final NumericExpression armorClass;
  final NumericExpression hitPoints;
  final FreeText speed;

  final FreeText senses;
  final FreeText languages;
  final NumericExpression proficiencyBonus;

  final List<DamageModifier> damageMods;
  // Ability Scores + Save profs
  final NumericExpression strengthScore;
  final Proficiency strengthSave;
  final NumericExpression dexterityScore;
  final Proficiency dexteritySave;
  final NumericExpression constitutionScore;
  final Proficiency constitutionSave;
  final NumericExpression intelligenceScore;
  final Proficiency intelligenceSave;
  final NumericExpression wisdomScore;
  final Proficiency wisdomSave;
  final NumericExpression charismaScore;
  final Proficiency charismaSave;

  // skills
  final List<SkillProficiency> skillProficiencies;

  // Free Texts
  final List<FreeText> abilities;
  final List<FreeText> actions;
  final List<FreeText> bonusActions;
  final List<FreeText> reactions;

  SummonTemplate({
    String? id,
    required this.name,
    required this.armorClass,
    required this.hitPoints,
    required this.speed,
    required this.senses,
    required this.languages,
    required this.proficiencyBonus,
    required this.damageMods,
    required this.strengthScore,
    required this.strengthSave,
    required this.dexterityScore,
    required this.dexteritySave,
    required this.constitutionScore,
    required this.constitutionSave,
    required this.intelligenceScore,
    required this.intelligenceSave,
    required this.wisdomScore,
    required this.wisdomSave,
    required this.charismaScore,
    required this.charismaSave,
    required this.skillProficiencies,
    required this.abilities,
    required this.bonusActions,
    required this.reactions,
    bool save = false,
    required this.actions,
  }) : this._id = id ?? Uuid().v1() {
    if (save) SummonService.saveTemplate(this);
  }

  Set<String> get variableTags {
    Set<String> tags = {};
    tags.addAll(armorClass.variableTags);
    tags.addAll(hitPoints.variableTags);
    tags.addAll(speed.variableTags);
    tags.addAll(senses.variableTags);
    tags.addAll(languages.variableTags);
    tags.addAll(proficiencyBonus.variableTags);
    tags.addAll(strengthScore.variableTags);
    tags.addAll(dexterityScore.variableTags);
    tags.addAll(constitutionScore.variableTags);
    tags.addAll(intelligenceScore.variableTags);
    tags.addAll(wisdomScore.variableTags);
    tags.addAll(charismaScore.variableTags);
    return tags;
  }
}
