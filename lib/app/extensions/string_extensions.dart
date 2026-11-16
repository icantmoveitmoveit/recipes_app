extension DifficultyLabel on String {
  /// Перевод уровня сложности, который приходит из API.
  String get difficultyLabel => switch (toLowerCase()) {
        'easy' => 'лёгкая',
        'medium' => 'средняя',
        'hard' => 'сложная',
        _ => this,
      };
}
