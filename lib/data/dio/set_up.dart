import 'package:recipes_app/di/di.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void setUpDio() {
  // Общая часть адресов запросов. API DummyJSON не требует ключа,
  // поэтому параметр api_token не добавляется.
  dio.options.baseUrl = 'https://dummyjson.com';
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);

  dio.interceptors.addAll([
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
      ),
    ),
  ]);
}
