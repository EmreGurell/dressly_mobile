import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();

  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? 'http://192.168.1.9:8000/api/v1';
  static const tokenKey = 'auth_token';
  static const refreshTokenKey = 'refresh_token';
  static const themeKey = 'app_theme';
  static const localeKey = 'app_locale';

  static String get geminiApiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
}

