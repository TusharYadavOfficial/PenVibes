import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  late final FlutterSecureStorage storage;
  factory SecureStorageService() {
    return _instance;
  }

  SecureStorageService._internal() {
    storage = const FlutterSecureStorage();
  }

  Future<void> writeData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> deleteData({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllData() async {
    await storage.deleteAll();
  }
}
