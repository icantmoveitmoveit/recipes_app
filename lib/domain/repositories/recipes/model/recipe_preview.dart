import 'package:json_annotation/json_annotation.dart';

part 'recipe_preview.g.dart';

/// Краткая информация о рецепте для списка на главном экране.
@JsonSerializable()
class RecipePreview {
  final int id;
  @JsonKey(name: 'name')
  final String title;
  final String image;
  final String cuisine;
  final String difficulty;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final double rating;

  RecipePreview({
    required this.id,
    required this.title,
    required this.image,
    required this.cuisine,
    required this.difficulty,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.rating,
  });

  int get totalTime => prepTimeMinutes + cookTimeMinutes;

  factory RecipePreview.fromJson(Map<String, dynamic> json) =>
      _$RecipePreviewFromJson(json);

  Map<String, dynamic> toJson() => _$RecipePreviewToJson(this);
}
