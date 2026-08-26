// ignore_for_file: public_member_api_docs, constant_identifier_names

// FKs
/// template id
const c_T_id = 'T_id';

/// variable id
const c_v_id = 'v_id';

/// skillname
const c_skill_name = 'skill_name';

const T_SUMMON_TEMPLATES = 'SUMMON_TEMPLATES';
const c_t_name = 'template_name';
const c_hit_points = 'hit_points';
const c_armor_class = 'armor_class';
const c_speed = 'speed';
const c_senses = 'senses';
const c_languages = 'languages';
const c_proficiency_bonus = 'proficiency_bonus';

const T_ABILITY_SCORES = 'ABILITY_SCORES';
const c_ability = 'ability';
const c_ability_score = 'ability_score';
const c_a_proficiency = 'proficiency';

const T_SKILLS = 'SKILLS';
// skill_name PK
const c_skill_ability = 'ability';

const T_skill_proficiencies = 'SKILL_PROFICIENCIES';
// t_id
// skill_name
const c_s_proficiency = 'skill_proficiency';

const T_VARIABLES = 'VARIABLES';
const c_var_id = 'id';
const c_v_tag = 'tag';
const c_v_display_name = 'var_display';
const c_v_value = 'variable_value';

const T_TEMPLATE_VARIABLES = 'TEMPLATE_VARIABLES';
// t_id
// v_id

const T_FEATURES = 'FEATURES';
//t_id FK
const c_feature_type = 'feature_type';
const c_feature_name = 'feature_name';
const c_feature_text = 'feature_text';

const T_DAMAGE_TYPES = 'DAMAGE_TYPES';
const c_damage_name_long = 'damage_name_long';
const c_is_magical = 'is_magical';

const T_DAMAGE_MODIFIERS = 'DAMAGE_MODIFIERS';
// t_id FK
const c_damage_type = 'damage_type'; //String
const c_damage_mod = 'damage_mod'; //int

const createFeaturesTable =
    '''
CREATE TABLE $T_FEATURES (
  $c_T_id TEXT NOT NULL,
  $c_feature_type INT NOT NULL,
  $c_feature_name TEXT NOT NULL,
  $c_feature_text TEXT NOT NULL, 
  PRIMARY KEY($c_T_id, $c_feature_type, $c_feature_text),
  FOREIGN KEY($c_T_id) REFERENCES $T_SUMMON_TEMPLATES($c_T_id) ON DELETE CASCADE
)
''';

const createSummonTemplatesTable =
    '''
CREATE TABLE $T_SUMMON_TEMPLATES (
  $c_T_id TEXT PRIMARY KEY ,
  $c_t_name,
  $c_hit_points TEXT NOT NULL,
  $c_armor_class TEXT NOT NULL,
  $c_speed TEXT NOT NULL,
  $c_senses TEXT NOT NULL,
  $c_languages TEXT NOT NULL,
  $c_proficiency_bonus TEXT NOT NULL
)
''';

const createAbilityScoresTable =
    '''
CREATE TABLE $T_ABILITY_SCORES (
  $c_T_id TEXT NOT NULL,
  $c_ability INT NOT NULL,
  $c_ability_score TEXT NOT NULL,
  $c_a_proficiency INTEGER NOT NULL,
  PRIMARY KEY ($c_T_id, $c_ability),
  FOREIGN KEY ($c_T_id) REFERENCES $T_SUMMON_TEMPLATES($c_T_id) ON DELETE CASCADE
  )
''';

const createSkillsTable =
    '''
CREATE TABLE $T_SKILLS (
  $c_skill_name TEXT NOT NULL,
  $c_skill_ability INT NOT NULL,
  PRIMARY KEY ($c_skill_name)
)
''';

const createSkillProficienciesTable =
    '''
CREATE TABLE $T_skill_proficiencies (
  $c_T_id TEXT NOT NULL,
  $c_skill_name TEXT NOT NULL,
  $c_s_proficiency INTEGER NOT NULL,
  PRIMARY KEY ($c_T_id, $c_skill_name),
  FOREIGN KEY ($c_T_id) REFERENCES $T_SUMMON_TEMPLATES($c_T_id) ON DELETE CASCADE,
  FOREIGN KEY ($c_skill_name) REFERENCES $T_SKILLS($c_skill_name) ON DELETE CASCADE
)
''';
const createDamageTypeTable =
    '''
CREATE TABLE $T_DAMAGE_TYPES (
  $c_damage_name_long TEXT NOT NULL,
  $c_is_magical INT NOT NULL,
  PRIMARY KEY ($c_damage_name_long)
)
''';

const createDamageModTable =
    '''
CREATE TABLE $T_DAMAGE_MODIFIERS (
  $c_T_id TEXT NOT NULL,
  $c_damage_name_long TEXT NOT NULL,
  $c_damage_mod INT NOT NULL,
  PRIMARY KEY ($c_T_id, $c_damage_name_long),
  FOREIGN KEY ($c_T_id) REFERENCES $T_SUMMON_TEMPLATES($c_T_id) ON DELETE CASCADE,
  FOREIGN KEY ($c_damage_name_long) REFERENCES $T_DAMAGE_TYPES($c_damage_name_long) ON DELETE CASCADE
)
''';

const createVariablesTable =
    '''
CREATE TABLE $T_VARIABLES (
  $c_v_id TEXT NOT NULL,
  $c_v_display_name TEXT NOT NULL,
  $c_v_tag TEXT NOT NULL,
  $c_v_value INTEGER NOT NULL,
  PRIMARY KEY ($c_v_id)
)
''';

const createTemplateVariablesTable =
    '''
CREATE TABLE $T_TEMPLATE_VARIABLES (
  $c_T_id TEXT NOT NULL,
  $c_v_id TEXT NOT NULL,
  PRIMARY KEY ($c_T_id, $c_v_id),
  FOREIGN KEY ($c_T_id) REFERENCES $T_SUMMON_TEMPLATES($c_T_id) ON DELETE CASCADE,
  FOREIGN KEY ($c_v_id) REFERENCES $T_VARIABLES($c_v_id) ON DELETE CASCADE
)
''';
