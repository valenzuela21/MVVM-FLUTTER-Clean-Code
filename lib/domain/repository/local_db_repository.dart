import 'package:sqflite/sqflite.dart';
import 'package:logger/logger.dart';
import '../../data/data_resource/local_data_sqlift.dart';

final logger = Logger();

class LocalRepositoryDatabase {
  Future<int> insertBrand(Map<String, dynamic> brand) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.insert('brand', brand);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<int> insertCategory(Map<String, dynamic> category) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.insert('category', category);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<int> insertProduct(Map<String, dynamic> product) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.insert('product', product);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final db = await DatabaseHelper.instance.database;
      var result = await db.rawQuery('''
      SELECT product.id, product.name AS product_name, product.description, product.price, product.rating,
             brand.name AS brand_name, category.name AS category_name
      FROM product
      LEFT JOIN brand ON product.brand_id = brand.id
      LEFT JOIN category ON product.category_id = category.id
    ''');
      return result;
    } catch (e) {
      logger.e("Error: $e");
      return [];
    }
  }

  Future<int> getProductCount() async {
    try {
      final db = await DatabaseHelper.instance.database;
      var result = await db.rawQuery('''
    SELECT COUNT(*) FROM product
    ''');
      int count = Sqflite.firstIntValue(result) ?? 0;
      return count;
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getBrands() async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.query('brand');
    } catch (e) {
      logger.e("Error: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.query('category');
    } catch (e) {
      logger.e("Error: $e");
      return [];
    }
  }

  Future<int> deleteProduct(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.delete('product', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<int> deleteBrand(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.delete('brand', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<int> deleteCategory(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.delete('category', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }

  Future<int> updateProduct(Map<String, dynamic> product) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.update('product', product,
          where: 'id = ?', whereArgs: [product['id']]);
    } catch (e) {
      logger.e("Error: $e");
      return -1;
    }
  }
}
