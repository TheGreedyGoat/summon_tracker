import 'package:math_expressions/math_expressions.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:summon_tracker/models/ability.dart';
import 'package:summon_tracker/models/action_feature.dart';
import 'package:summon_tracker/models/damage_mod.dart';
import 'package:summon_tracker/models/free_text.dart';
import 'package:summon_tracker/models/numeric_expression.dart';
import 'package:summon_tracker/models/skill.dart';
import 'package:summon_tracker/models/summon_template.dart';
import 'package:summon_tracker/models/variable.dart';
import 'package:summon_tracker/services/database/data_base_tables.dart';

class DatabaseService {
  static const _dataBaseName = 'summon_tracker_database';
  Database? _db;

  /// The active instance
  static final DatabaseService instance = DatabaseService._();

  DatabaseService._();

  Future<Database> get database async {
    _db ??= await _createDatabase();
    return _db!;
  }

  Future<void> _createV1Tables(Database db) async {
    await db.execute(createFeaturesTable);
    await db.execute(createSummonTemplatesTable);
    await db.execute(createAbilityScoresTable);

    await db.execute(createSkillsTable);
    await db.execute(createSkillProficienciesTable);

    await db.execute(createDamageTypeTable);
    await db.execute(createDamageModTable);

    await db.execute(createVariablesTable);
    await db.execute(createTemplateVariablesTable);
  }

  Future<Database> _createDatabase() async {
    final databaseDirPath = getDatabasesPath();
    final dataBasePath = join(await databaseDirPath, _dataBaseName);
    final database = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) async {
        await _createV1Tables(db);
      },

      onUpgrade: (db, oldVersion, newVersion) {},
    );

    return database;
  }

  Future<String?> insertTemplate(SummonTemplate template) async {
    final db = await database;
    try {
      //core
      final coreTable = template.coreMap;
      await db.insert(T_SUMMON_TEMPLATES, coreTable);
      // damage mods
      for (final dMod in template.damageMods) {
        final type = dMod.damageType;
        await ensureDMGTypeExists(type);
        await db.insert(
          T_DAMAGE_MODIFIERS,
          <String, dynamic>{
            c_T_id: template.id,
            c_damage_name_long: type.longName,
            c_damage_mod: dMod.damageMod.index,
          },
        );
      }

      // ability scores
      final aScores = template.abilityScores;
      for (final ab in aScores) {
        await db.insert(T_ABILITY_SCORES, {
          c_T_id: template.id,
          c_ability: ab.ability.index,
          c_ability_score: ab.score.toString(),
          c_a_proficiency: ab.proficiency.index,
        });
      }
      // skills
      for (final skillProf in template.skillProficiencies) {
        await ensureSkill(skillProf.skill);
        await db.insert(T_skill_proficiencies, {
          c_T_id: template.id,
          c_skill_name: skillProf.skill.name,
          c_s_proficiency: skillProf.prof.index,
        });
      }

      // features
      final feats = template.featuresCompact;
      for (int i = 0; i < feats.length; i++) {
        final l = feats[i];
        for (final feat in l) {
          await db.insert(T_FEATURES, {
            c_T_id: template.id,
            c_feature_type: i,
            c_feature_name: feat.name,
            c_feature_text: feat.description,
          });
        }
      }
      // t_variables
      for (final variable in template.templateVariables) {
        await db.insert(T_VARIABLES, variable.toJson());
        await db.insert(T_TEMPLATE_VARIABLES, {
          c_T_id: template.id,
          c_v_id: variable.id,
        });
      }
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> ensureDMGTypeExists(DamageType type) async {
    final db = await database;
    if (!(await damageTypes).contains(type)) {
      await db.insert(T_DAMAGE_TYPES, {
        c_damage_name_long: type.longName,
        c_is_magical: type.isMagical ? 1 : 0,
      });
    }
  }

  Future<void> ensureSkill(Skill skill) async {
    final db = await database;
    if ((await db.query(
      T_SKILLS,
      where: '$c_skill_name = ?',
      whereArgs: [skill.name],
    )).isEmpty) {
      await db.insert(T_SKILLS, {
        c_skill_name: skill.name,
        c_skill_ability: skill.ability.index,
      });
    }
  }

  Future<SummonTemplate?> getTemplate(String id) async {
    final db = await database;
    try {
      final core = (await db.query(
        T_SUMMON_TEMPLATES,
        where: '$c_T_id = ?',
        whereArgs: [id],
      ))[0];

      final abilityQuery = await db.query(
        T_ABILITY_SCORES,
        where: '$c_T_id = ?',
        whereArgs: [id],
      );
      final aScores = [
        for (final json in abilityQuery)
          AbilityScoreNum(
            ability: Ability.values[json[c_ability] as int],
            score: NumericExpression.tryParse(
              json[c_ability_score].toString(),
            )!,
            proficiency: Proficiency.values[json[c_a_proficiency] as int],
          ),
      ];

      final skills = await this.skills;

      final skillProfQ = await db.query(
        T_skill_proficiencies,
        where: '$c_T_id = ?',
        whereArgs: [id],
      );

      final skillProfs = skillProfQ
          .map(
            (json) => SkillProficiency(
              skill: skills.firstWhere((skill) {
                return skill.name == json[c_skill_name].toString();
              }),
              prof: Proficiency.values[json[c_s_proficiency] as int],
            ),
          )
          .toList();

      final featQuery = await db.query(
        T_FEATURES,
        where: '$c_T_id = ?',
        whereArgs: [id],
      );
      final feats = [
        for (int i = 0; i < 4; i++)
          featQuery
              .where(
                (json) => json[c_feature_type] as int == i,
              )
              .map(
                (json) => ActionFeature(
                  name: json[c_feature_name].toString(),
                  description: json[c_feature_text].toString(),
                ),
              )
              .toList(),
      ];

      final tVarQuery = await db.query(
        T_VARIABLES,
        where:
            '''
$c_v_id = (
SELECT $c_v_id 
  FROM $T_TEMPLATE_VARIABLES 
  WHERE $c_T_id = ?
)
''',
        whereArgs: [id],
      );
      final tVars = tVarQuery
          .map(
            (json) => MyVariable(
              displayName: json[c_v_display_name].toString(),
              tag: json[c_v_tag].toString(),
              value: json[c_v_value] as int,
            ),
          )
          .toList();
      return SummonTemplate(
        //core
        name: core[c_t_name].toString(),
        armorClass: NumericExpression.tryParse(core[c_armor_class].toString())!,
        hitPoints: NumericExpression.tryParse(core[c_armor_class].toString())!,
        speed: FreeText(raw: core[c_speed].toString()),
        senses: FreeText(raw: core[c_senses].toString()),
        languages: FreeText(raw: core[c_languages].toString()),
        proficiencyBonus: NumericExpression.tryParse(
          core[c_proficiency_bonus].toString(),
        )!,
        // dmg
        damageMods: await getDmgModifiers(id),
        // aScores
        strengthScore: aScores.firstWhere(
          (ab) => ab.ability == Ability.str,
        ),
        dexterityScore: aScores.firstWhere(
          (ab) => ab.ability == Ability.dex,
        ),
        constitutionScore: aScores.firstWhere(
          (ab) => ab.ability == Ability.con,
        ),
        intelligenceScore: aScores.firstWhere(
          (ab) => ab.ability == Ability.int,
        ),
        wisdomScore: aScores.firstWhere(
          (ab) => ab.ability == Ability.wis,
        ),
        charismaScore: aScores.firstWhere(
          (ab) => ab.ability == Ability.cha,
        ),
        // skillProfs
        skillProficiencies: skillProfs,
        // feats
        featAbilities: feats[0],
        bonusActions: feats[1],
        reactions: feats[2],
        actions: feats[3],
        //tVars
        templateVariables: tVars,
      );
    } catch (e) {
      print('caught while getting tmpl: $e');
      rethrow;
    }
  }

  Future<List<SummonTemplate>> get templates async {
    final db = await database;
    final idQuery = await db.query(T_SUMMON_TEMPLATES);
    final fut = idQuery.map(
      (json) => getTemplate(json[c_T_id].toString()),
    );
    return <SummonTemplate>[for (final f in fut) (await f)!];
  }

  Future<List<DamageModifier>> getDmgModifiers(String tID) async {
    final db = await database;
    final query = await db.query(
      T_DAMAGE_MODIFIERS,
      where: '$c_T_id = ?',
      whereArgs: [tID],
    );

    final dmgTypes = await damageTypes;

    return [
      for (final json in query)
        DamageModifier(
          damageType: dmgTypes.firstWhere(
            (type) => type.longName == json[c_damage_name_long],
          ),
          damageMod: DamageMod.values[json[c_damage_mod] as int],
        ),
    ];
  }

  Future<List<DamageType>> get damageTypes async {
    final db = await database;
    final query = await db.query(T_DAMAGE_TYPES);
    return query
        .map(
          (json) => DamageType(
            longName: json[c_damage_name_long].toString(),
            isMagical: intToBool(json[c_is_magical] as int),
          ),
        )
        .toList();
  }

  Future<List<Skill>> get skills async {
    final db = await database;
    final query = await db.query(T_SKILLS);
    return query.map((json) {
      print(json[c_skill_ability]);
      return Skill(
        name: json[c_skill_name].toString(),
        ability: Ability.values[json[c_skill_ability] as int],
      );
    }).toList();
  }

  Future<void> reset() async {
    if ((await databaseExists(await getDatabasesPath()))) {
      await deleteDatabase(await getDatabasesPath());
    }
  }

  bool intToBool(int value) => value == 1;
}
