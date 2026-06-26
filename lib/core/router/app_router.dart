import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/auth/presentation/pages/email_login_page.dart';
import 'package:ai_try_on/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:ai_try_on/features/auth/presentation/pages/login_page.dart';
import 'package:ai_try_on/features/auth/presentation/pages/onboarding_page.dart';
import 'package:ai_try_on/features/auth/presentation/pages/register_page.dart';
import 'package:ai_try_on/features/auth/presentation/pages/splash_page.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/presentation/pages/all_products_page.dart';
import 'package:ai_try_on/features/brands/presentation/pages/brand_detail_page.dart';
import 'package:ai_try_on/features/brands/presentation/pages/brands_page.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/presentation/pages/feed_page.dart';
import 'package:ai_try_on/features/profile/presentation/pages/profile_page.dart';
import 'package:ai_try_on/features/saved/presentation/pages/saved_page.dart';
import 'package:ai_try_on/features/tryon/presentation/pages/tryon_page.dart';
import 'package:ai_try_on/features/notifications/presentation/pages/notifications_page.dart';
import 'package:ai_try_on/features/feed/presentation/pages/recommendations_page.dart';
import 'package:ai_try_on/features/tryon/presentation/pages/tryon_history_page.dart';
import 'package:ai_try_on/features/product_detail/presentation/pages/product_detail_page.dart';
import 'package:ai_try_on/shared/services/auth_service.dart';
import 'package:ai_try_on/shared/widgets/main_shell.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  redirect: _authGuard,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.emailLogin,
      builder: (_, __) => const EmailLoginPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (_, __) => const RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (_, __) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (_, __) => const OnboardingPage(),
    ),
    ShellRoute(
      builder: (_, __, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.feed,
          builder: (_, __) => const FeedPage(),
        ),
        GoRoute(
          path: AppRoutes.brands,
          builder: (_, __) => const BrandsPage(),
          routes: [
            GoRoute(
              path: 'all',
              builder: (_, __) => const AllProductsPage(),
            ),
            GoRoute(
              path: ':id',
              builder: (_, state) {
                final brand = state.extra as Brand?;
                final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
                return BrandDetailPage(
                  brand: brand ?? Brand(id: id, name: '', logoUrl: ''),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.saved,
          builder: (_, __) => const SavedPage(),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (_, __) => const ProfilePage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.tryon,
      builder: (_, state) {
        final product = state.extra as Product?;
        return TryOnPage(product: product);
      },
    ),
    GoRoute(
      path: '/products/:id',
      builder: (_, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        final cached = state.extra as Product?;
        return ProductDetailPage(productId: id, cached: cached);
      },
    ),
    GoRoute(
      path: AppRoutes.notifications,
      builder: (_, __) => const NotificationsPage(),
    ),
    GoRoute(
      path: AppRoutes.tryonHistory,
      builder: (_, __) => const TryonHistoryPage(),
    ),
    GoRoute(
      path: AppRoutes.recommendations,
      builder: (_, __) => const RecommendationsPage(),
    ),
  ],
);

String? _authGuard(context, state) {
  final isAuthenticated = sl<AuthService>().isAuthenticated;
  final isAuthRoute = [
    AppRoutes.login,
    AppRoutes.emailLogin,
    AppRoutes.register,
    AppRoutes.splash,
    AppRoutes.forgotPassword,
    AppRoutes.onboarding,
  ].contains(state.matchedLocation);

  if (!isAuthenticated && !isAuthRoute) return AppRoutes.login;
  return null;
}
