import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:summon_tracker/models/summon_template.dart';
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

  Future<void> _createV0Tables(Database db) async {
    await db.execute(createSummonTemplatesTable);
    await db.execute(createAbilityScoresTable);
    await db.execute(createDamageModifiersTable);
    await db.execute(createSkillProficienciesTable);
    await db.execute(createVariablesTable);
    await db.execute(createTemplateVariablesTable);
  }

  Future<Database> _createDatabase() async {
    final databaseDirPath = getDatabasesPath();
    final dataBasePath = join(await databaseDirPath, _dataBaseName);
    final database = await openDatabase(
      dataBasePath,
      version: 0,
      onCreate: (db, version) async {
        await _createV0Tables(db);
      },

      onUpgrade: (db, oldVersion, newVersion) {},
    );

    return database;
  }

  Future<bool> insertTemplate(SummonTemplate template) async {
    final db = await database;
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
