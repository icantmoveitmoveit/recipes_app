import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/di/di.dart';
import 'package:recipes_app/domain/domain.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipesRepositoryInterface recipesRepository;

  RecipeBloc(this.recipesRepository) : super(RecipeInitial()) {
    on<RecipeLoad>(_recipeLoad);
  }

  Future<void> _recipeLoad(RecipeLoad event, Emitter<RecipeState> emit) async {
    try {
      if (state is! RecipeLoadSuccess) {
        emit(RecipeLoadInProgress());
      }
      final recipe = await recipesRepository.getRecipe(event.id);
      emit(RecipeLoadSuccess(recipe: recipe));
    } catch (exception, stackTrace) {
      emit(RecipeLoadFailure(exception: exception));
      talker.handle(exception, stackTrace);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}
