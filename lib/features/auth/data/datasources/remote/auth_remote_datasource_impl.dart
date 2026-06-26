import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:ai_try_on/features/auth/data/models/user_model.dart';
import 'package:ai_try_on/shared/services/secure_storage_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _client;
  final SecureStorageService _secureStorage;
  AuthRemoteDataSourceImpl(this._client, this._secureStorage);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.dio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    await _saveTokens(response.data['data']);
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _client.dio.post(
      ApiEndpoints.register,
      data: {'email': email, 'password': password, 'name': name},
    );
    await _saveTokens(response.data['data']);
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        clientId: '248914446234-7dck70i4711f84f0qbc86v2oepui6hv3.apps.googleusercontent.com',
      );
      final account = await googleSignIn.signIn();
      if (account == null) throw const AuthException('Google sign-in cancelled');

      final auth = await account.authentication;
      final idToken = auth.idToken;
      if (idToken == null) throw const AuthException('Google ID token is null');

      final response = await _client.dio.post(
        ApiEndpoints.googleAuth,
        data: {'token': idToken},
      );
      await _saveTokens(response.data['data']);
      return UserModel.fromJson(response.data['data']['user']);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithApple() async {
    try {
      final isAvailable = await SignInWithApple.isAvailable();
      if (!isAvailable) throw const AuthException('Apple Sign-In is not available on this device');

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final displayName = [credential.givenName, credential.familyName]
          .where((e) => e != null && e.isNotEmpty)
          .join(' ');

      final response = await _client.dio.post(
        ApiEndpoints.appleAuth,
        data: {
          'token': credential.identityToken,
          if (displayName.isNotEmpty) 'display_name': displayName,
        },
      );
      await _saveTokens(response.data['data']);
      return UserModel.fromJson(response.data['data']['user']);
    } on AuthException {
      rethrow;
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const AuthException('Apple Sign-In cancelled');
      }
      throw const AuthException('Apple Sign-In is not supported on simulators. Use a real device.');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await _client.dio.post(ApiEndpoints.logout);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _client.dio.post(
      ApiEndpoints.forgotPassword,
      data: {'email': email},
    );
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    await _client.dio.post(
      ApiEndpoints.verifyOtp,
      data: {'email': email, 'otp': otp},
    );
  }

  @override
  Future<UserModel> getMe() async {
    final response = await _client.dio.get(ApiEndpoints.me);
    return UserModel.fromJson(response.data['data']);
  }

  @override
  Future<UserModel> updateMeasurements({
    String? gender,
    int? heightCm,
    int? weightKg,
    int? chestCm,
    int? waistCm,
    int? hipsCm,
  }) async {
    final response = await _client.dio.patch(
      ApiEndpoints.measurements,
      data: {
        if (gender != null) 'gender': gender,
        if (heightCm != null) 'height_cm': heightCm,
        if (weightKg != null) 'weight_kg': weightKg,
        if (chestCm != null) 'chest_cm': chestCm,
        if (waistCm != null) 'waist_cm': waistCm,
        if (hipsCm != null) 'hips_cm': hipsCm,
      },
    );
    return UserModel.fromJson(response.data['data']);
  }

  Future<void> _saveTokens(Map<String, dynamic> data) async {
    await _secureStorage.saveToken(data['access']);
    await _secureStorage.saveRefreshToken(data['refresh']);
  }
}

