# Network / API Katmanı

## Ne Zaman Bu Dosyaya Bak
- API isteği yazıyorsun (GET, POST, PUT, DELETE)
- Interceptor ekliyorsun / değiştiriyorsun
- Token refresh, auth header, error handling
- "Dio", "API", "endpoint", "interceptor", "network" geçen istekler

---

## Yapı

```
core/network/
├── dio_client.dart
├── api_endpoints.dart
└── interceptors/
    ├── auth_interceptor.dart
    ├── refresh_interceptor.dart
    ├── error_interceptor.dart
    └── logging_interceptor.dart
```

---

## Dio Client

```dart
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _dio.interceptors.addAll([
      AuthInterceptor(),
      RefreshInterceptor(_dio),
      ErrorInterceptor(),
      if (kDebugMode) LoggingInterceptor(),
    ]);
  }

  Dio get dio => _dio;
}
```

---

## Auth Interceptor

```dart
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = sl<SecureStorageService>().getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
```

---

## Refresh Interceptor

```dart
class RefreshInterceptor extends Interceptor {
  final Dio _dio;
  RefreshInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await sl<AuthService>().refreshToken();
        final response = await _dio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (_) {
        sl<AuthService>().logout();
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}
```

---

## Error Interceptor

```dart
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    throw switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout => TimeoutException(),
      DioExceptionType.badResponse => _handleStatusCode(err.response),
      DioExceptionType.connectionError => NoInternetException(),
      _ => UnknownException(),
    };
  }

  AppException _handleStatusCode(Response? response) =>
      switch (response?.statusCode) {
        400 => BadRequestException(response?.data),
        401 => UnauthorizedException(),
        403 => ForbiddenException(),
        404 => NotFoundException(),
        500 => ServerException(),
        _ => UnknownException(),
      };
}
```

---

## API Endpoints

```dart
class ApiEndpoints {
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const refresh = '/auth/refresh';
  static const logout = '/auth/logout';
  static const me = '/users/me';
  static String user(String id) => '/users/$id';
}
```
❌ Datasource içinde asla string endpoint yazma — `ApiEndpoints` kullan.

---

## Datasource Kuralı

```dart
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _client;
  UserRemoteDataSourceImpl(this._client);

  @override
  Future<UserModel> getUser(String id) async {
    final response = await _client.dio.get(ApiEndpoints.user(id));
    return UserModel.fromJson(response.data);
  }
}
```
- Datasource try/catch yazmaz — interceptor halleder.
- Model parse datasource'da yapılır.
- Repository exception'ı Failure'a çevirir.

