import 'package:internet_connection_checker/internet_connection_checker.dart';

class CustomInternetChecker {
  /// Checks if there is an active internet connection.
  ///
  /// This function uses the `InternetConnectionChecker` class to check if the device has an active internet connection.
  ///
  /// Returns:
  /// - `Future<bool>`: A `Future` that resolves to `true` if there is an active internet connection, and `false` otherwise.
  static Future<bool> checkInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
