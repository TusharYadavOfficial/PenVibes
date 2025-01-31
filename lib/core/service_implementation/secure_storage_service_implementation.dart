import '../database/database_services/secure_storage_service.dart';

class SecureStorageServiceImplementation {
  final secureStorageService = SecureStorageService();

  Future<void> writeData({required String key, required String value}) async {
    await secureStorageService.writeData(key: key, value: value);
  }
}
