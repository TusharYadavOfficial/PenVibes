import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pen_vibes/core/constants/api_config_constants.dart';
import 'service_impl/user_service_impl.dart';

class ServiceLocator {
  static final GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
          baseUrl: ApiConfigConstants.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60),
          contentType: ApiConfigConstants.CONTENT_TYPE,
          headers: ApiConfigConstants.HEADERS_MAP,
          receiveTimeout: const Duration(seconds: 60),
        )));
    getIt.registerLazySingleton<UserServiceImpl>(
        () => UserServiceImpl(dio: getIt<Dio>()));
  }
}
