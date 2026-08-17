import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/action_feature.dart';
import 'package:summon_tracker/models/free_text.dart';
import 'package:summon_tracker/models/numeric_expression.dart';
import 'package:summon_tracker/models/skill.dart';
import 'package:summon_tracker/services/database/data_base_tables.dart';
import 'package:summon_tracker/models/damage_mod.dart';
import 'package:summon_tracker/services/summon_service.dart';
import 'package:uuid/uuid.dart';

part 'summon_template.freezed.dart';

@freezed
class SummonTemplate with _$SummonTemplate {
  //General
  @override
  final String _id;
  String get id => _id;
  @override
  final String name;

  @override
  final NumericExpression armorClass;
  @override
  final NumericExpression hitPoints;
  @override
  final FreeText speed;

  @override
  final FreeText senses;
  @override
  final FreeText languages;
  @override
  final NumericExpression proficiencyBonus;

  @override
  final List<DamageModifier> damageMods;
  // Ability Scores + Save profs
  @override
  final NumericExpression strengthScore;
  @override
  final Proficiency strengthSave;
  @override
  final NumericExpression dexterityScore;
  @override
  final Proficiency dexteritySave;
  @override
  final NumericExpression constitutionScore;
  @override
  final Proficiency constitutionSave;
  @override
  final NumericExpression intelligenceScore;
  @override
  final Proficiency intelligenceSave;
  @override
  final NumericExpression wisdomScore;
  @override
  final Proficiency wisdomSave;
  @override
  final NumericExpression charismaScore;
  @override
  final Proficiency charismaSave;

  // skills
  @override
  final List<SkillProficiency> skillProficiencies;

  // Features
  @override
  final List<ActionFeature> abilities;
  @override
  final List<ActionFeature> actions;
  @override
  final List<ActionFeature> bonusActions;
  @override
  final List<ActionFeature> reactions;

  final Map<String, int> templateVariables;

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
    required this.templateVariables,
    bool save = false,
    required this.actions,
  }) : this._id = id ?? Uuid().v1() {
    if (save) SummonService.saveTemplate(this);
  }

  Map<String, String> get coreMap => {
    c_id: id,
    c_hit_points: hitPoints.toString(),
    c_armor_class: armorClass.toString(),
    c_speed: speed.toString(),
    c_senses: senses.toString(),
    c_languages: languages.toString(),
    c_proficiency_bonus: proficiencyBonus.toString(),
  };

  //todo
  Map<String, dynamic> get abilityMap => {};

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

  Set<String> get instanceVariableTags => variableTags
      .where(
        (tag) => !templateVariables.containsKey(tag),
      )
      .toSet();
}
