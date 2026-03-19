import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/shared/services/storage_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final StorageService _storage;
  static const _key = 'theme_mode';

  ThemeCubit(this._storage) : super(_load(_storage));

  static ThemeMode _load(StorageService storage) {
    return switch (storage.getString(_key)) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  void setTheme(ThemeMode mode) {
    emit(mode);
    _storage.setString(_key, mode.name);
  }
}
