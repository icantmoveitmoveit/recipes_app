import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/app/app.dart';
import 'package:recipes_app/di/di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _home = getIt<HomeBloc>();

  void loadHome() => _home.add(const HomeLoad());

  Future<void> refreshHome() {
    final completer = Completer<void>();
    _home.add(HomeLoad(completer: completer));
    return completer.future;
  }

  @override
  void initState() {
    loadHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: 'Рецепты',
        actions: [
          IconButton(
            tooltip: 'Логи',
            icon: const Icon(Icons.bug_report_outlined),
            onPressed: () => context.push('/logs'),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _home,
        builder: (context, state) {
          return switch (state) {
            HomeInitial() => _buildHomeInitial(),
            HomeLoadInProgress() => _buildHomeLoadInProgress(),
            HomeLoadSuccess() => _buildHomeLoadSuccess(state),
            HomeLoadFailure() => _buildHomeLoadFailure(state),
          };
        },
      ),
    );
  }

  Widget _buildHomeInitial() => const SizedBox.shrink();

  Widget _buildHomeLoadInProgress() => const AppProgressIndicator();

  Widget _buildHomeLoadSuccess(HomeLoadSuccess state) {
    final recipes = state.recipes;

    return RefreshIndicator(
      onRefresh: refreshHome,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Все рецепты',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: recipes.length,
              itemBuilder: (_, index) => RecipeCard(recipe: recipes[index]),
              separatorBuilder: (_, __) => 16.ph,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeLoadFailure(HomeLoadFailure state) {
    return AppError(
      description: state.exception.toString(),
      onTap: loadHome,
    );
  }
}
