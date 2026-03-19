# Navigation — go_router

## Ne Zaman Bu Dosyaya Bak
- Yeni sayfa/route ekliyorsun
- Sayfalar arası geçiş yapıyorsun
- "Route", "navigate", "go_router", "push", "pop" geçen istekler

---

## Yapı

```
core/router/
├── app_router.dart
├── app_routes.dart
└── guards/
    └── auth_guard.dart
```

## Route Sabitleri

```dart
class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const profile = '/profile';
  static String userDetail(String id) => '/users/$id';
}
```
❌ Sayfada asla string route yazma — `AppRoutes` kullan.

## GoRouter

```dart
final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  redirect: _authGuard,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashPage()),
    GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginPage()),
    GoRoute(path: AppRoutes.home, builder: (_, __) => const HomePage()),
    GoRoute(
      path: '/users/:id',
      builder: (_, state) => UserDetailPage(userId: state.pathParameters['id']!),
    ),
  ],
);
```

## Auth Guard

```dart
String? _authGuard(BuildContext context, GoRouterState state) {
  final isAuthenticated = sl<AuthService>().isAuthenticated;
  final isAuthRoute = state.matchedLocation == AppRoutes.login;
  if (!isAuthenticated && !isAuthRoute) return AppRoutes.login;
  if (isAuthenticated && isAuthRoute) return AppRoutes.home;
  return null;
}
```

## Navigasyon

```dart
context.go(AppRoutes.home);           // git (stack temizle)
context.push(AppRoutes.profile);      // push
context.push(AppRoutes.userDetail(id)); // parametreli
context.pop();                        // geri
context.pop(result);                  // result ile geri
```

