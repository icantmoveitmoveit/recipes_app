class Endpoints {
  Endpoints._();

  static const String recipes = '/recipes';

  static String recipe(int id) => '/recipes/$id';
}
