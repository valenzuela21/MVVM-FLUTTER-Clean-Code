import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class DatabaseHelper {
  static Database? _database;

  static const String DB_NAME = 'shop_database.db';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, DB_NAME);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        try {
          // Crear tablas
          await db.execute('''
          CREATE TABLE brand (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
          await db.execute('''
          CREATE TABLE category (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
          await db.execute('''
          CREATE TABLE product (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            brand_id INTEGER,
            price REAL,
            category_id INTEGER,
            rating REAL,
            created_on DATETIME,
            updated_on DATETIME,
            FOREIGN KEY(brand_id) REFERENCES brand(id),
            FOREIGN KEY(category_id) REFERENCES category(id)
          )
        ''');
          logger.i('Create Tables Success Fully 🌟');
        }catch(e){
          logger.e('Error create tables: $e');
        }
      },
    );
  }
}
