import 'package:hive/hive.dart';

import '../../models/category/category_model.dart';

class CategoryCache {
  static const String _boxName = 'categories';

  Future<Box<CategoryModel>> _openBox() async {
    return await Hive.openBox<CategoryModel>(_boxName);
  }

  /// Cache’ga saqlash
  void cacheCategories(List<CategoryModel> categories) async {
    final box = await _openBox();
    await box.clear();
    await box.addAll(categories);
  }

  /// Cache’dan olish
  Future<List<CategoryModel>> getCachedCategories() async {
    final box = await _openBox();
    return box.values.toList();
  }

  /// Cache bo‘shmi tekshirish
  // Future<bool> hasCache() async {
  //   final box = await _openBox();
  //   return box.isNotEmpty;
  // }
}
