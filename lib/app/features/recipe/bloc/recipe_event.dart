part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class RecipeLoad extends RecipeEvent {
  const RecipeLoad({required this.id, this.completer});

  final int id;
  final Completer? completer;

  @override
  List<Object> get props => [id];
}
