import 'package:dio/dio.dart';
import 'package:recipes_app/data/data.dart';

import 'model/model.dart';
import 'recipes_repository_interface.dart';

class RecipesRepository implements RecipesRepositoryInterface {
  RecipesRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<RecipePreview>> getRecipes() async {
    try {
      final Response response = await dio.get(
        Endpoints.recipes,
        queryParameters: {
          'limit': 0, // 0 - получить все рецепты
          'select': 'id,name,image,cuisine,difficulty,'
              'prepTimeMinutes,cookTimeMinutes,rating',
        },
      );
      final recipes = (response.data['recipes'] as List)
          .map((e) => RecipePreview.fromJson(e as Map<String, dynamic>))
          .toList();
      return recipes;
    } on DioException catch (e) {
      throw e.message ?? 'Не удалось загрузить список рецептов';
    }
  }

  @override
  Future<Recipe> getRecipe(int id) async {
    try {
      final Response response = await dio.get(Endpoints.recipe(id));
      return Recipe.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw e.message ?? 'Не удалось загрузить рецепт';
    }
  }
}
