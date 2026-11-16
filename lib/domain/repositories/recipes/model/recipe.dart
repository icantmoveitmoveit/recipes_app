import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

/// Полная информация о рецепте для экрана деталей.
@JsonSerializable()
class Recipe {
  final int id;
  @JsonKey(name: 'name')
  final String title;
  final String image;
  final String cuisine;
  final String difficulty;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final int caloriesPerServing;
  final double rating;
  final int reviewCount;
  final List<String> ingredients;
  final List<String> instructions;
  final List<String> tags;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.cuisine,
    required this.difficulty,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.caloriesPerServing,
    required this.rating,
    required this.reviewCount,
    required this.ingredients,
    required this.instructions,
    required this.tags,
  });

  int get totalTime => prepTimeMinutes + cookTimeMinutes;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
