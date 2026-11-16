import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_colors.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColors.background,
      colorScheme: _colorScheme,
      appBarTheme: _appBarTheme,
    );
  }
}

final _colorScheme = ColorScheme.fromSeed(
  seedColor: ThemeColors.accent,
);

const _appBarTheme = AppBarTheme(
  toolbarHeight: 56,
  elevation: 0,
  scrolledUnderElevation: 0,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ThemeColors.white,
  ),
  iconTheme: IconThemeData(color: ThemeColors.white),
  actionsIconTheme: IconThemeData(color: ThemeColors.white),
  backgroundColor: ThemeColors.black,
  systemOverlayStyle: SystemUiOverlayStyle.light,
);
