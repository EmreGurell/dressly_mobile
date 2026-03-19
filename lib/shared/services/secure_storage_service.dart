import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ai_try_on/core/constants/app_constants.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  String? _cachedToken;

  String? getCachedToken() => _cachedToken;

  Future<void> saveToken(String token) async {
    _cachedToken = token;
    await _storage.write(key: AppConstants.tokenKey, value: token);
  }

  Future<String?> getToken() async {
    _cachedToken = await _storage.read(key: AppConstants.tokenKey);
    return _cachedToken;
  }

  Future<void> saveRefreshToken(String token) async =>
      _storage.write(key: AppConstants.refreshTokenKey, value: token);

  Future<String?> getRefreshToken() async =>
      _storage.read(key: AppConstants.refreshTokenKey);

  Future<void> clearAll() async {
    _cachedToken = null;
    await _storage.deleteAll();
  }
}

