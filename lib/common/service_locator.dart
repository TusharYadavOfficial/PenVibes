import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/service_impl/user_service_impl.dart';

class ServiceLocator {
  static final GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
          baseUrl: 'http://localhost:9722',
          connectTimeout: const Duration(
              seconds: 60), // Optional: Set connect timeout (5 seconds)
          receiveTimeout: const Duration(
              seconds: 60), // Optional: Set receive timeout (3 seconds)
        )));
    getIt.registerLazySingleton<UserServiceImpl>(
        () => UserServiceImpl(dio: getIt<Dio>()));
  }
}
