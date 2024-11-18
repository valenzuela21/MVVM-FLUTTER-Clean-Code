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
      logger.e("Error Insert Brand: $e");
      return -1;
    }
  }

  Future<int> insertCategory(Map<String, dynamic> category) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.insert('category', category);
    } catch (e) {
      logger.e("Error Insert Category: $e");
      return -1;
    }
  }

  Future<int> insertProduct(Map<String, dynamic> product) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.insert('product', product);
    } catch (e) {
      logger.e("Error Insert Product: $e");
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
      logger.e("Error Product All: $e");
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
      logger.e("Error Product: $e");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getBrands() async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.query('brand');
    } catch (e) {
      logger.e("Error Brand: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.query('category');
    } catch (e) {
      logger.e("Error Category: $e");
      return [];
    }
  }

  Future<int> deleteProduct(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.delete('product', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      logger.e("Error Delete Product: $e");
      return -1;
    }
  }

  Future<int> deleteBrand(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.delete('brand', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      logger.e("Error Delete Brand: $e");
      return -1;
    }
  }

  Future<int> deleteCategory(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.delete('category', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      logger.e("Error Delete Category: $e");
      return -1;
    }
  }

  Future<int> updateProduct(Map<String, dynamic> product) async {
    try {
      final db = await DatabaseHelper.instance.database;
      return await db.update('product', product,
          where: 'id = ?', whereArgs: [product['id']]);
    } catch (e) {
      logger.e("Error Update Product: $e");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    try {
      final db = await DatabaseHelper.instance.database;
      var result = await db.rawQuery('''
      SELECT product.id, product.name AS product_name, product.description, product.price, product.rating,
             brand.name AS brand_name, category.name AS category_name
      FROM product
      LEFT JOIN brand ON product.brand_id = brand.id
      LEFT JOIN category ON product.category_id = category.id
      WHERE product.name LIKE ? OR product.description LIKE ?
    ''', ['%$query%', '%$query%']);

      return result;
    } catch (e) {
      logger.e("Error Search Products: $e");
      return [];
    }
  }


  Future<Map<String, dynamic>?> getProductById(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      var result = await db.rawQuery('''
      SELECT product.id, product.name AS product_name, product.description, product.price, product.rating,
             brand.name AS brand_name, category.name AS category_name
      FROM product
      LEFT JOIN brand ON product.brand_id = brand.id
      LEFT JOIN category ON product.category_id = category.id
      WHERE product.id = ?
    ''', [id]);

      if (result.isNotEmpty) {
        return result.first;
      } else {
        return null; // No product found
      }
    } catch (e) {
      logger.e("Error Get Product By ID: $e");
      return null;
    }
  }

}
