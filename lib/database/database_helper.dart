import 'package:my_ai_fitness_buddy/database/model/base_database_entity.dart';
import 'package:my_ai_fitness_buddy/database/model/exercise.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 2;

  static final columnId = '_id';
  static final columnName = 'name';

  static final tableExercise = 'exercise';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  void insert(List<BaseDatabaseEntity> entities) async {
    Database db = await instance.database;
    for (BaseDatabaseEntity entity in entities) {
      await db.insert(entity.tableName, entity.toMap());
    }
  }

// Query (get all)
  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;

    return await db.query(table);
  }

// Update
  Future<int> update(BaseDatabaseEntity entity) async {
    Database db = await instance.database;
    String table = entity.tableName;

    return await db.update(table, entity.toMap(), where: '$columnId = ?', whereArgs: [entity.getId()]);
  }

// Delete
  Future<int> delete(BaseDatabaseEntity entity) async {
    Database db = await instance.database;
    return await db.delete(entity.tableName, where: '$columnId = ?', whereArgs: [entity.getId()]);
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    print("Seeding database with exercises...");

    await db.execute('''       
          CREATE TABLE exercise (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL
          );
          ''');
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Push Up')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Bench Press')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Squat')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Deadlift')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Shoulder Press')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Pull Up')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Barbell Row')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Bicep Curl')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Tricep Dip')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Lunge')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Plank')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Crunch')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Lat Pulldown')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Leg Press')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Calf Raise')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Chest Fly')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Russian Twist')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Mountain Climber')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Burpee')");
    await db.rawInsert("INSERT INTO exercise ($columnName) VALUES ('Hip Thrust')");
  }
}
