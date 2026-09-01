// ignore_for_file: public_member_api_docs, constant_identifier_names

import 'package:sqflite/sqflite.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';

abstract class Tables {
  static const SUMMON_MASTERS = 'SUMMON_MASTERS';
  static const SUMMON_VARIANTS = 'SUMMON_VARIANTS';
  static const SUMMON_INSTANCES = 'SUMMON_INSTANCES';

  static const ABILITY_SCORES = 'ABILITY_SCORES';
  static const SKILLS = 'SKILLS';
  static const VARIABLES = 'VARIABLES';
  static const SKILL_PROFICIENCIES = 'SKILL_PROFICIENCIES';
  static const FEATURES = 'FEATURES';
  static const DAMAGE_TYPES = 'DAMAGE_TYPES';
  static const DAMAGE_MODIFIERS = 'DAMAGE_MODIFIERS';

  static const createSummonMastersTable =
      '''
CREATE TABLE $SUMMON_MASTERS(
  ${Columns.master_id} TEXT NOT NULL,
  ${Columns.master_name} TEXT NOT NULL,

  PRIMARY KEY(${Columns.master_id})
)
''';

  static const createSummonVariantsTable =
      '''
CREATE TABLE $SUMMON_VARIANTS (
  ${Columns.variant_id} TEXT NOT NULL ,
  ${Columns.master_id} TEXT NOT NULL,

  ${Columns.variant_name} TEXT NOT NULL,
  ${Columns.hit_points} TEXT NOT NULL,
  ${Columns.armor_class} TEXT NOT NULL,
  ${Columns.speed} TEXT NOT NULL,
  ${Columns.senses} TEXT NOT NULL,
  ${Columns.languages} TEXT NOT NULL,
  ${Columns.proficiency_bonus} TEXT NOT NULL,
  PRIMARY KEY(${Columns.variant_id}),
  FOREIGN KEY(${Columns.master_id}) REFERENCES $SUMMON_MASTERS(${Columns.master_id}) ON DELETE CASCADE
)
''';
  static const createSummonInstanceTable =
      '''
CREATE TABLE $SUMMON_INSTANCES(
  ${Columns.instance_id} TEXT NOT NULL,
  ${Columns.instance_name} TEXT NOT NULL,
  ${Columns.variant_id} TEXT NOT NULL,
  PRIMARY KEY (${Columns.instance_id}),
  FOREIGN KEY (${Columns.variant_id}) REFERENCES $SUMMON_VARIANTS(${Columns.variant_id}) ON DELETE CASCADE
)
''';
  static const createAbilityScoresTable =
      '''
CREATE TABLE $ABILITY_SCORES (
  ${Columns.variant_id} TEXT NOT NULL,
  ${Columns.ability} INT NOT NULL,
  ${Columns.ability_score} TEXT NOT NULL,
  ${Columns.ability_proficiency} INTEGER NOT NULL,
  PRIMARY KEY (${Columns.variant_id}, ${Columns.ability}),
  FOREIGN KEY (${Columns.variant_id}) REFERENCES $SUMMON_VARIANTS(${Columns.variant_id}) ON DELETE CASCADE
  )
''';

  static const createSkillsTable =
      '''
CREATE TABLE $SKILLS (
  ${Columns.skill_name} TEXT NOT NULL,
  ${Columns.skill_ability} INT NOT NULL,
  PRIMARY KEY (${Columns.skill_name})
)
''';

  static const createSkillProficienciesTable =
      '''
CREATE TABLE $SKILL_PROFICIENCIES (
  ${Columns.variant_id} TEXT NOT NULL,
  ${Columns.skill_name} TEXT NOT NULL,
  ${Columns.skill_proficiency} INTEGER NOT NULL,
  PRIMARY KEY (${Columns.variant_id}, ${Columns.skill_name}),
  FOREIGN KEY (${Columns.variant_id}) REFERENCES $SUMMON_VARIANTS(${Columns.variant_id}) ON DELETE CASCADE,
  FOREIGN KEY (${Columns.skill_name}) REFERENCES $SKILLS(${Columns.skill_name}) ON DELETE CASCADE
)
''';
  static const createDamageTypeTable =
      '''
CREATE TABLE $DAMAGE_TYPES (
  ${Columns.damage_name_long} TEXT NOT NULL,
  ${Columns.damage_is_magical} INT NOT NULL,
  PRIMARY KEY (${Columns.damage_name_long})
)
''';

  static const createDamageModTable =
      '''
CREATE TABLE $DAMAGE_MODIFIERS (
  ${Columns.variant_id} TEXT NOT NULL,
  ${Columns.damage_name_long} TEXT NOT NULL,
  ${Columns.damage_mod} INT NOT NULL,
  PRIMARY KEY (${Columns.variant_id}, ${Columns.damage_name_long}),
  FOREIGN KEY (${Columns.variant_id}) REFERENCES $SUMMON_VARIANTS(${Columns.variant_id}) ON DELETE CASCADE,
  FOREIGN KEY (${Columns.damage_name_long}) REFERENCES $DAMAGE_TYPES(${Columns.damage_name_long}) ON DELETE CASCADE
)
''';
  static const createFeaturesTable =
      '''
CREATE TABLE $FEATURES (
  ${Columns.variant_id} TEXT NOT NULL,
  ${Columns.feature_type} INT NOT NULL,
  ${Columns.feature_name} TEXT NOT NULL,
  ${Columns.feature_text} TEXT NOT NULL, 
  PRIMARY KEY(${Columns.variant_id}, ${Columns.feature_type}, ${Columns.feature_text}),
  FOREIGN KEY(${Columns.variant_id}) REFERENCES $SUMMON_VARIANTS(${Columns.variant_id}) ON DELETE CASCADE
)
''';
  static const createVariablesTable =
      '''
CREATE TABLE $VARIABLES (
  ${Columns.variable_id} TEXT NOT NULL,
  ${Columns.variant_id} TEXT,
  ${Columns.variable_display_name} TEXT NOT NULL,
  ${Columns.variable_tag} TEXT NOT NULL,
  ${Columns.variable_value} INTEGER,
  PRIMARY KEY (${Columns.variable_id})
)
''';

  static List<String> get v1Creates => [
    createSummonMastersTable,
    createSummonVariantsTable,
    createSummonInstanceTable,
    createAbilityScoresTable,
    createSkillsTable,
    createSkillProficienciesTable,
    createDamageTypeTable,
    createDamageModTable,
    createFeaturesTable,
    createVariablesTable,
  ];
}

abstract class Columns {
  static const master_id = 'master_id';
  static const master_name = 'master_name';
  static const variant_id = 'variant_id';

  /// variable id
  static const variable_id = 'variable_id';

  static const instance_id = 'instance_id';
  static const instance_name = 'instance_name';

  /// skillname
  static const skill_name = 'skill_name';

  static const variant_name = 'template_name';
  static const hit_points = 'hit_points';
  static const armor_class = 'armor_class';
  static const speed = 'speed';
  static const senses = 'senses';
  static const languages = 'languages';
  static const proficiency_bonus = 'proficiency_bonus';

  static const ability = 'ability';
  static const ability_score = 'ability_score';
  static const ability_proficiency = 'proficiency';

  // skill_name PK
  static const skill_ability = 'ability';

  // t_id
  // skill_name
  static const skill_proficiency = 'skill_proficiency';

  static const variable_tag = 'tag';
  static const variable_display_name = 'var_display';
  static const variable_value = 'variable_value';

  // t_id
  // v_id

  //t_id FK
  static const feature_type = 'feature_type';
  static const feature_name = 'feature_name';
  static const feature_text = 'feature_text';

  static const damage_name_long = 'damage_name_long';
  static const damage_is_magical = 'is_magical';

  // t_id FK
  static const damage_type = 'damage_type'; //String
  static const damage_mod = 'damage_mod'; //int
}
