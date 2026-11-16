import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/app/app.dart';
import 'package:recipes_app/domain/domain.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final RecipePreview recipe;

  @override
  Widget build(BuildContext context) {
    const imageSize = 100.0;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => context.push('/recipe/${recipe.id}'),
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: imageSize,
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(url: recipe.image, width: imageSize, height: imageSize),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      'Кухня: ${recipe.cuisine}\n'
                      'Сложность: ${recipe.difficulty.difficultyLabel}\n'
                      '${recipe.totalTime} мин  •  ★ ${recipe.rating}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
