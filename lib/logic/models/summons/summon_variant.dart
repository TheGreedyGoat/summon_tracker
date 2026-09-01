import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/logic/models/ability.dart';
import 'package:summon_tracker/logic/models/action_feature.dart';
import 'package:summon_tracker/logic/models/free_text.dart';
import 'package:summon_tracker/logic/models/numeric_expression.dart';
import 'package:summon_tracker/logic/models/skill.dart';
import 'package:summon_tracker/logic/models/summons/summon_instance.dart';
import 'package:summon_tracker/logic/models/variable.dart';
import 'package:summon_tracker/logic/services/database/data_base_tables.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';

part 'summon_variant.freezed.dart';

@freezed
class SummonVariant with _$SummonVariant {
  //General
  @override
  final String id;
  @override
  final String name;
  @override
  final String masterID;

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
  final List<SummonInstance> instances;
  @override
  final List<MyVariableSet> variantVariables;
  final List<MyVariable> instanceVariables;

  SummonVariant({
    required this.id,
    required this.name,
    required this.masterID,
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
    required this.variantVariables,
    required this.instanceVariables,
    required this.actions,
    this.instances = const [],
  });
  Map<String, String> get toTableRow => {
    Columns.variant_id: id,
    Columns.variant_name: name,
    Columns.master_id: masterID,
    Columns.hit_points: hitPoints.toString(),
    Columns.armor_class: armorClass.toString(),
    Columns.speed: speed.toString(),
    Columns.senses: senses.toString(),
    Columns.languages: languages.toString(),
    Columns.proficiency_bonus: proficiencyBonus.toString(),
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

  Set<String> get variantVariableTags => variantVariables
      .map(
        (e) => e.tag,
      )
      .toSet();

  Set<String> get instanceVariableTags => variableTags
      .where(
        (tag) => !variantVariableTags.contains(tag),
      )
      .toSet();
}
