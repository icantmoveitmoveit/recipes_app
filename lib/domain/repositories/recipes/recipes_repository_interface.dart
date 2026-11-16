import 'model/model.dart';

abstract interface class RecipesRepositoryInterface {
  Future<List<RecipePreview>> getRecipes();

  Future<Recipe> getRecipe(int id);
}
