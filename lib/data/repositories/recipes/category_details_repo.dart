import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/category_details_model.dart';
import '../../../core/client.dart';

class CategoryDetailsRepository {
  List<CategoryDetailsModel> categoryDetails = [];
  final ApiClient client;

  CategoryDetailsRepository({required this.client});

  Future<Result<List<CategoryDetailsModel>>> getAll(int id) async {
    if (categoryDetails.isNotEmpty) return Result.ok(categoryDetails);
    final result = await client.get<List>('/recipes/list?Category=$id');
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => CategoryDetailsModel.fromJson(x)).toList(),
      ),
    );
  }
}
