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

  Future<int> insertBrand(Map<String, dynamic> brand) async {
    final db = await database;
    return await db.insert('brand', brand);
  }

  Future<int> insertCategory(Map<String, dynamic> category) async {
    final db = await database;
    return await db.insert('category', category);
  }

  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.insert('product', product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    var result = await db.rawQuery('''
      SELECT product.id, product.name AS product_name, product.description, product.price, product.rating,
             brand.name AS brand_name, category.name AS category_name
      FROM product
      LEFT JOIN brand ON product.brand_id = brand.id
      LEFT JOIN category ON product.category_id = category.id
    ''');
    return result;
  }

  Future<List<Map<String, dynamic>>> getBrands() async {
    final db = await database;
    return await db.query('brand');
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await database;
    return await db.query('category');
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteBrand(int id) async {
    final db = await database;
    return await db.delete('brand', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteCategory(int id) async {
    final db = await database;
    return await db.delete('category', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.update('product', product, where: 'id = ?', whereArgs: [product['id']]);
  }
}
