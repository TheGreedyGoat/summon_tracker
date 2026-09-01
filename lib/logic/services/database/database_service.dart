import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:summon_tracker/logic/models/ability.dart';
import 'package:summon_tracker/logic/models/action_feature.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';
import 'package:summon_tracker/logic/models/free_text.dart';
import 'package:summon_tracker/logic/models/numeric_expression.dart';
import 'package:summon_tracker/logic/models/skill.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/logic/models/summons/summon_variant.dart';
import 'package:summon_tracker/logic/models/variable.dart';
import 'package:summon_tracker/logic/services/database/data_base_tables.dart';

/// provides reading and writing access to the database. Access via [DatabaseService].[instance].
///
/// For testing purposes, create a secondary instance using [testService]
class DatabaseService {
  /// The base database name. To reference a db always use [fullName]!
  static const _dataBaseName = 'summon_tracker_database';
  Database? _db;

  /// The active instance
  static final DatabaseService instance = DatabaseService._();

  /// returns another instance of [DatabaseService] for testing purposes so tests don't modify the main database.
  /// Make sure to reset/ delete after usage
  static DatabaseService get testService => DatabaseService._('_test');

  final String _nameExt;

  /// returns the actual name of this db instance.
  String get fullName => '$_dataBaseName$_nameExt';
  DatabaseService._([this._nameExt = '']);

  /// returns the database ssociated with this instance.
  Future<Database> get database async {
    _db ??= await _createDatabase();
    return _db!;
  }

  Future<void> _createV1Tables(Database db) async {
    for (final sql in Tables.v1Creates) {
      await db.execute(sql);
    }
  }

  Future<String> get _fullDBPath async =>
      join(await getDatabasesPath(), fullName);

  Future<Database> _createDatabase() async {
    final databaseDirPath = getDatabasesPath();
    final database = await openDatabase(
      await _fullDBPath,
      version: 1,
      onCreate: (db, version) async {
        await _createV1Tables(db);
      },

      onUpgrade: (db, oldVersion, newVersion) {},
    );

    return database;
  }

  Future<String?> insertMaster(SummonMaster master) async {
    try {
      final db = await database;
      await db.insert(Tables.SUMMON_MASTERS, {
        Columns.master_id: master.id,
        Columns.master_name: master.name,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> insertVariant(SummonVariant variant) async {
    final db = await database;
    try {
      //core
      final coreTable = variant.toTableRow;
      await db.insert(Tables.SUMMON_VARIANTS, coreTable);
      // damage mods
      for (final dMod in variant.damageMods) {
        final type = dMod.damageType;
        await ensureDMGTypeExists(type);
        await db.insert(
          Tables.DAMAGE_MODIFIERS,
          <String, dynamic>{
            Columns.variant_id: variant.id,
            Columns.damage_name_long: type.longName,
            Columns.damage_mod: dMod.damageMod.index,
          },
        );
      }

      // ability scores
      final aScores = variant.abilityScores;
      for (final ab in aScores) {
        await db.insert(Tables.ABILITY_SCORES, {
          Columns.variant_id: variant.id,
          Columns.ability: ab.ability.index,
          Columns.ability_score: ab.score.toString(),
          Columns.ability_proficiency: ab.proficiency.index,
        });
      }
      // skills
      for (final skillProf in variant.skillProficiencies) {
        await ensureSkill(skillProf.skill);
        await db.insert(Tables.SKILL_PROFICIENCIES, {
          Columns.variant_id: variant.id,
          Columns.skill_name: skillProf.skill.name,
          Columns.skill_proficiency: skillProf.prof.index,
        });
      }

      // features
      final feats = variant.featuresCompact;
      for (int i = 0; i < feats.length; i++) {
        final l = feats[i];
        for (final feat in l) {
          await db.insert(Tables.FEATURES, {
            Columns.variant_id: variant.id,
            Columns.feature_type: i,
            Columns.feature_name: feat.name,
            Columns.feature_text: feat.description,
          });
        }
      }
      // v_variables
      for (final variable in variant.variantVariables) {
        final json = variable.toJson();
        json[Columns.variant_id] = variant.id;
        await db.insert(Tables.VARIABLES, json);
      }
      // i_variabless
      for (final variable in variant.instanceVariables) {
        final json = variable.toJson();
        json[Columns.variant_id] = variant.id;
        await db.insert(Tables.VARIABLES, json);
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> ensureDMGTypeExists(DamageType type) async {
    final db = await database;
    if (!(await damageTypes).contains(type)) {
      await db.insert(Tables.DAMAGE_TYPES, {
        Columns.damage_name_long: type.longName,
        Columns.damage_is_magical: type.isMagical ? 1 : 0,
      });
    }
  }

  Future<void> ensureSkill(Skill skill) async {
    final db = await database;
    if ((await db.query(
      Tables.SKILLS,
      where: '${Columns.skill_name} = ?',
      whereArgs: [skill.name],
    )).isEmpty) {
      await db.insert(Tables.SKILLS, {
        Columns.skill_name: skill.name,
        Columns.skill_ability: skill.ability.index,
      });
    }
  }

  /// tries to fetch the summon master object with the given id including all corresponding variants
  Future<SummonMaster?> getSummonMaster(String id) async {
    try {
      final db = await database;
      final queryMaster = await db.query(
        Tables.SUMMON_MASTERS,
        where: '${Columns.master_id} = ?',
        whereArgs: [id],
      );

      final queryVariants = await db.query(
        Tables.SUMMON_VARIANTS,
        where: '${Columns.master_id} = ?',
        columns: [Columns.variant_id],
        whereArgs: [id],
      );
      final List<SummonVariant> variants = List.empty(growable: true);
      for (final r in queryVariants) {
        final result = await getSummonVariant(r[Columns.variant_id].toString());
        if (result != null) variants.add(result);
      }

      return SummonMaster(
        id: id,
        variants: variants,
        name: queryMaster[0][Columns.master_name].toString(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteSummonMaster(
    String id, {
    required Future<bool> Function() confirmationCallback,
  }) async {
    if (!(await confirmationCallback())) {
      return false;
    }
    ;
    try {
      final db = await database;
      await db.delete(
        Tables.SUMMON_MASTERS,
        where: '${Columns.master_id} = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      rethrow;
      return false;
    }
  }

  Future<SummonVariant?> getSummonVariant(String id) async {
    final db = await database;
    try {
      final core = (await db.query(
        Tables.SUMMON_VARIANTS,
        where: '${Columns.variant_id} = ?',
        whereArgs: [id],
      ))[0];

      final abilityQuery = await db.query(
        Tables.ABILITY_SCORES,
        where: '${Columns.variant_id} = ?',
        whereArgs: [id],
      );
      final aScores = [
        for (final json in abilityQuery)
          AbilityScoreNum(
            ability: Ability.values[json[Columns.ability] as int],
            score: NumericExpression.tryParse(
              json[Columns.ability_score].toString(),
            )!,
            proficiency:
                Proficiency.values[json[Columns.ability_proficiency] as int],
          ),
      ];

      final skills = await this.skills;

      final skillProfQ = await db.query(
        Tables.SKILL_PROFICIENCIES,
        where: '${Columns.variant_id} = ?',
        whereArgs: [id],
      );

      final skillProfs = skillProfQ
          .map(
            (json) => SkillProficiency(
              skill: skills.firstWhere((skill) {
                return skill.name == json[Columns.skill_name].toString();
              }),
              prof: Proficiency.values[json[Columns.skill_proficiency] as int],
            ),
          )
          .toList();

      final featQuery = await db.query(
        Tables.FEATURES,
        where: '${Columns.variant_id} = ?',
        whereArgs: [id],
      );
      final feats = [
        for (int i = 0; i < 4; i++)
          featQuery
              .where(
                (json) => json[Columns.feature_type] as int == i,
              )
              .map(
                (json) => ActionFeature(
                  name: json[Columns.feature_name].toString(),
                  description: json[Columns.feature_text].toString(),
                ),
              )
              .toList(),
      ];

      List<MyVariableSet> vVariables = List.empty(growable: true);
      List<MyVariable> iVariables = List.empty(growable: true);
      final variableQuery = await db.query(
        Tables.VARIABLES,
        where: '${Columns.variant_id} = ?',
        whereArgs: [id],
      );
      for (final q in variableQuery) {
        if (q[Columns.variable_value] == null) {
          iVariables.add(
            MyVariable(
              displayName: q[Columns.variable_display_name].toString(),
              tag: q[Columns.variable_tag].toString(),
            ),
          );
        } else {
          vVariables.add(
            MyVariableSet(
              displayName: q[Columns.variable_display_name].toString(),
              tag: q[Columns.variable_tag].toString(),
              value: q[Columns.variable_value]! as int,
            ),
          );
        }
      }

      return SummonVariant(
        //core
        id: id,
        name: core[Columns.variant_name].toString(),
        masterID: core[Columns.master_id].toString(),
        armorClass: NumericExpression.tryParse(
          core[Columns.armor_class].toString(),
        )!,
        hitPoints: NumericExpression.tryParse(
          core[Columns.hit_points].toString(),
        )!,
        speed: FreeText(raw: core[Columns.speed].toString()),
        senses: FreeText(raw: core[Columns.senses].toString()),
        languages: FreeText(raw: core[Columns.languages].toString()),
        proficiencyBonus: NumericExpression.tryParse(
          core[Columns.proficiency_bonus].toString(),
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
        variantVariables: vVariables,
        instanceVariables: iVariables,
      );
    } catch (e) {
      rethrow;
      return null;
    }
  }

  Future<List<String>> get masterIDs async {
    final db = await database;
    final masterQuery = await db.query(
      Tables.SUMMON_MASTERS,
      columns: [Columns.master_id],
    );
    return masterQuery
        .map(
          (e) => e[Columns.master_id].toString(),
        )
        .toList();
  }

  Future<List<SummonMaster>> get summonMasters async {
    final ids = await masterIDs;
    final List<SummonMaster> masters = List.empty(growable: true);
    for (final id in ids) {
      masters.add((await getSummonMaster(id))!);
    }
    return masters;
  }

  Future<List<SummonVariant>> get variants async {
    final db = await database;
    final idQuery = await db.query(Tables.SUMMON_VARIANTS);
    final fut = idQuery.map(
      (json) => getSummonVariant(json[Columns.variant_id].toString()),
    );
    return <SummonVariant>[for (final f in fut) (await f)!];
  }

  Future<List<DamageModifier>> getDmgModifiers(String tID) async {
    final db = await database;
    final query = await db.query(
      Tables.DAMAGE_MODIFIERS,
      where: '${Columns.variant_id} = ?',
      whereArgs: [tID],
    );

    final dmgTypes = await damageTypes;

    return [
      for (final json in query)
        DamageModifier(
          damageType: dmgTypes.firstWhere(
            (type) => type.longName == json[Columns.damage_name_long],
          ),
          damageMod: DamageMod.values[json[Columns.damage_mod] as int],
        ),
    ];
  }

  Future<List<DamageType>> get damageTypes async {
    final db = await database;
    final query = await db.query(Tables.DAMAGE_TYPES);
    return query
        .map(
          (json) => DamageType(
            longName: json[Columns.damage_name_long].toString(),
            isMagical: intToBool(json[Columns.damage_is_magical] as int),
          ),
        )
        .toList();
  }

  Future<List<Skill>> get skills async {
    final db = await database;
    final query = await db.query(Tables.SKILLS);
    return query.map((json) {
      return Skill(
        name: json[Columns.skill_name].toString(),
        ability: Ability.values[json[Columns.skill_ability] as int],
      );
    }).toList();
  }

  Future<void> reset([String? subPath]) async {
    final path = await join(await getDatabasesPath(), subPath ?? fullName);
    if ((await databaseExists(path))) {
      await deleteDatabase(path);
    }
  }

  bool intToBool(int value) => value == 1;
}
