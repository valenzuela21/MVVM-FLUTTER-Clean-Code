import 'package:sqflite/sqflite.dart';
import '../../data/data_resource/local_data_sqlift.dart';

class LocalRepositoryDatabase {


  Future<int> insertBrand(Map<String, dynamic> brand) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('brand', brand);
  }

  Future<int> insertCategory(Map<String, dynamic> category) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('category', category);
  }

  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('product', product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery('''
      SELECT product.id, product.name AS product_name, product.description, product.price, product.rating,
             brand.name AS brand_name, category.name AS category_name
      FROM product
      LEFT JOIN brand ON product.brand_id = brand.id
      LEFT JOIN category ON product.category_id = category.id
    ''');
    return result;
  }

  Future<int> getProductCount() async {
    final db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery('''
    SELECT COUNT(*) FROM product
    ''');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }

  Future<List<Map<String, dynamic>>> getBrands() async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('brand');
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('category');
  }

  Future<int> deleteProduct(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteBrand(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('brand', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteCategory(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('category', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateProduct(Map<String, dynamic> product) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update('product', product, where: 'id = ?', whereArgs: [product['id']]);
  }
}