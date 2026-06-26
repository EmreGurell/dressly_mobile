class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';
  static const emailLogin = '/email-login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const onboarding = '/onboarding';
  static const notifications = '/notifications';

  // Main shell routes
  static const feed = '/feed';
  static const brands = '/brands';
  static const saved = '/saved';
  static const profile = '/profile';

  // Sub routes
  static const tryon = '/tryon';
  static const tryonHistory = '/tryon-history';
  static const recommendations = '/recommendations';
  static const allProducts = '/brands/all';
  static String brandDetail(String id) => '/brands/$id';
  static String productDetail(String id) => '/products/$id';
}

