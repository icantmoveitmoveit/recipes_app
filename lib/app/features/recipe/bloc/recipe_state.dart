part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}

final class RecipeLoadInProgress extends RecipeState {}

final class RecipeLoadSuccess extends RecipeState {
  const RecipeLoadSuccess({required this.recipe});

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

final class RecipeLoadFailure extends RecipeState {
  const RecipeLoadFailure({required this.exception});

  final Object? exception;

  @override
  List<Object> get props => [];
}
