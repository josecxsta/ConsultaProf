import 'package:consulta_prof/services/secure_storage_service.dart';

class TokenRepository {
  static String _keyUserToken = "user_token";
  static String _keyDeviceToken = "device_token";

  Future<void> deleteTokens() async {
    return Future.wait([
      SecureStorageService().delete(key: _keyUserToken),
      SecureStorageService().delete(key: _keyDeviceToken)
    ]);
  }

  Future<String> getToken() {
    return SecureStorageService().read(key: _keyUserToken);
  }

  Future<void> persistToken(String token) async {
    await SecureStorageService().write(key: _keyUserToken, value: token);
  }

  Future<bool> hasToken() async {
    return await SecureStorageService().read(key: _keyUserToken) != null;
  }

  Future persistDeviceToken(String token) async {
    return SecureStorageService().write(key: _keyDeviceToken, value: token);
  }

  Future<String> getDeviceToken() {
    return SecureStorageService().read(key: _keyDeviceToken);
  }

  Future<bool> hasDeviceToken() async {
    return await SecureStorageService().read(key: _keyDeviceToken) != null;
  }
}
