import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/ability.dart';
import 'package:summon_tracker/models/action_feature.dart';
import 'package:summon_tracker/models/free_text.dart';
import 'package:summon_tracker/models/numeric_expression.dart';
import 'package:summon_tracker/models/skill.dart';
import 'package:summon_tracker/models/variable.dart';
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
  final AbilityScoreNum strengthScore;
  @override
  final AbilityScoreNum dexterityScore;
  @override
  final AbilityScoreNum constitutionScore;
  @override
  final AbilityScoreNum intelligenceScore;
  @override
  final AbilityScoreNum wisdomScore;
  @override
  final AbilityScoreNum charismaScore;

  // skills
  @override
  final List<SkillProficiency> skillProficiencies;

  // Features
  @override
  final List<ActionFeature> featAbilities;
  @override
  final List<ActionFeature> actions;
  @override
  final List<ActionFeature> bonusActions;
  @override
  final List<ActionFeature> reactions;
  @override
  List<List<ActionFeature>> get featuresCompact => [
    featAbilities,
    actions,
    bonusActions,
    reactions,
  ];
  @override
  final List<MyVariable> templateVariables;

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
    required this.dexterityScore,
    required this.constitutionScore,
    required this.intelligenceScore,
    required this.wisdomScore,
    required this.charismaScore,
    required this.skillProficiencies,
    required this.featAbilities,
    required this.bonusActions,
    required this.reactions,
    required this.templateVariables,
    bool save = false,
    required this.actions,
  }) : this._id = id ?? Uuid().v1() {
    if (save) SummonService.saveTemplate(this);
  }

  Map<String, String> get coreMap => {
    c_T_id: id,
    c_t_name: name,
    c_hit_points: hitPoints.toString(),
    c_armor_class: armorClass.toString(),
    c_speed: speed.toString(),
    c_senses: senses.toString(),
    c_languages: languages.toString(),
    c_proficiency_bonus: proficiencyBonus.toString(),
  };

  List<AbilityScoreNum> get abilityScores => [
    strengthScore,
    dexterityScore,
    constitutionScore,
    intelligenceScore,
    wisdomScore,
    charismaScore,
  ];

  Set<String> get variableTags {
    Set<String> tags = {};
    tags.addAll(armorClass.variableTags);
    tags.addAll(hitPoints.variableTags);
    tags.addAll(speed.variableTags);
    tags.addAll(senses.variableTags);
    tags.addAll(languages.variableTags);
    tags.addAll(proficiencyBonus.variableTags);
    tags.addAll(strengthScore.score.variableTags);
    tags.addAll(dexterityScore.score.variableTags);
    tags.addAll(constitutionScore.score.variableTags);
    tags.addAll(intelligenceScore.score.variableTags);
    tags.addAll(wisdomScore.score.variableTags);
    tags.addAll(charismaScore.score.variableTags);
    return tags;
  }

  Set<String> get templateVariableTags => templateVariables
      .map(
        (e) => e.tag,
      )
      .toSet();

  Set<String> get instanceVariableTags => variableTags
      .where(
        (tag) => !templateVariableTags.contains(tag),
      )
      .toSet();
}
