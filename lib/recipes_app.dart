import 'package:flutter/material.dart';
import 'package:recipes_app/app/app.dart';

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Книга рецептов',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
