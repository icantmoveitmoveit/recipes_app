import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/app/app.dart';
import 'package:recipes_app/di/di.dart';
import 'package:recipes_app/domain/domain.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key, required this.recipeId});

  final int recipeId;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final _recipeBloc = getIt<RecipeBloc>();

  void loadRecipe() => _recipeBloc.add(RecipeLoad(id: widget.recipeId));

  Future<void> refreshRecipe() {
    final completer = Completer<void>();
    _recipeBloc.add(RecipeLoad(id: widget.recipeId, completer: completer));
    return completer.future;
  }

  @override
  void initState() {
    loadRecipe();
    super.initState();
  }

  @override
  void dispose() {
    _recipeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(title: 'Рецепт'),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        bloc: _recipeBloc,
        builder: (context, state) {
          return switch (state) {
            RecipeInitial() => const SizedBox.shrink(),
            RecipeLoadInProgress() => const AppProgressIndicator(),
            RecipeLoadSuccess() => _buildRecipeLoadSuccess(state.recipe),
            RecipeLoadFailure() => AppError(
                description: state.exception.toString(),
                onTap: loadRecipe,
              ),
          };
        },
      ),
    );
  }

  Widget _buildRecipeLoadSuccess(Recipe recipe) {
    final textTheme = Theme.of(context).textTheme;

    return RefreshIndicator(
      onRefresh: refreshRecipe,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(url: recipe.image, height: 220, width: double.infinity),
            Text(
              recipe.title,
              style: textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                InfoChip(
                  icon: Icons.schedule,
                  label: '${recipe.totalTime} мин',
                ),
                InfoChip(
                  icon: Icons.people_outline,
                  label: '${recipe.servings} порц.',
                ),
                InfoChip(
                  icon: Icons.local_fire_department_outlined,
                  label: '${recipe.caloriesPerServing} ккал',
                ),
                InfoChip(
                  icon: Icons.star_outline,
                  label: '${recipe.rating} (${recipe.reviewCount})',
                ),
              ],
            ),
            Text(
              'Кухня: ${recipe.cuisine}. '
              'Сложность: ${recipe.difficulty.difficultyLabel}.',
              style: textTheme.bodyLarge,
            ),
            const SectionTitle('Ингредиенты'),
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final ingredient in recipe.ingredients)
                  Text('•  $ingredient', style: textTheme.bodyLarge),
              ],
            ),
            const SectionTitle('Приготовление'),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < recipe.instructions.length; i++)
                  Text(
                    '${i + 1}. ${recipe.instructions[i]}',
                    style: textTheme.bodyLarge,
                  ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in recipe.tags)
                  Chip(label: Text('#$tag')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
