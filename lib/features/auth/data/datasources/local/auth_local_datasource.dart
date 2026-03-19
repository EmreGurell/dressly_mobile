import 'dart:convert';
import 'package:ai_try_on/features/auth/data/models/user_model.dart';
import 'package:ai_try_on/shared/services/storage_service.dart';

abstract class AuthLocalDataSource {
  UserModel? getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const _userKey = 'cached_user';
  final StorageService _storage;
  AuthLocalDataSourceImpl(this._storage);

  @override
  UserModel? getCachedUser() {
    try {
      final json = _storage.getString(_userKey);
      if (json == null) return null;
      return UserModel.fromJson(jsonDecode(json));
    } catch (_) {
      _storage.remove(_userKey);
      return null;
    }
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    await _storage.setString(_userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<void> clearUser() async {
    await _storage.remove(_userKey);
  }
}

