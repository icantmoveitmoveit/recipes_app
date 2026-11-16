// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipePreview _$RecipePreviewFromJson(Map<String, dynamic> json) =>
    RecipePreview(
      id: (json['id'] as num).toInt(),
      title: json['name'] as String,
      image: json['image'] as String,
      cuisine: json['cuisine'] as String,
      difficulty: json['difficulty'] as String,
      prepTimeMinutes: (json['prepTimeMinutes'] as num).toInt(),
      cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$RecipePreviewToJson(RecipePreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'image': instance.image,
      'cuisine': instance.cuisine,
      'difficulty': instance.difficulty,
      'prepTimeMinutes': instance.prepTimeMinutes,
      'cookTimeMinutes': instance.cookTimeMinutes,
      'rating': instance.rating,
    };
