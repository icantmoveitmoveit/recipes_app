import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_app/app/app.dart';
import 'package:recipes_app/data/data.dart';
import 'package:recipes_app/domain/domain.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

final talker = TalkerFlutter.init();

final Dio dio = Dio();

Future<void> setupLocator() async {
  setUpDio();

  getIt.registerSingleton<Talker>(talker);

  getIt.registerSingleton<RecipesRepositoryInterface>(
    RecipesRepository(dio: dio),
  );

  getIt.registerSingleton(HomeBloc(getIt.get<RecipesRepositoryInterface>()));

  // Для экрана деталей создаётся новый блок при каждом открытии экрана.
  getIt.registerFactory(
    () => RecipeBloc(getIt.get<RecipesRepositoryInterface>()),
  );
}
