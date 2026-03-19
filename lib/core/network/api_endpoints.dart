class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const googleAuth = '/auth/google/';
  static const appleAuth = '/auth/apple/';
  static const refresh = '/auth/refresh';
  static const logout = '/auth/logout';
  static const forgotPassword = '/auth/forgot-password';
  static const resetPassword = '/auth/reset-password';
  static const verifyOtp = '/auth/verify-otp';

  // Feed
  static const feed = '/feed/';
  static const feedRefresh = '/feed/refresh/';

  // Products
  static const like = '/products/like/';
  static const save = '/products/save/';
  static const saved = '/products/saved/';
  static const brands = '/products/brands/';
  static String brandProducts(int id) => '/products/brands/$id/products/';

  // Try-On
  static const tryon = '/tryon/';

  // User
  static const me = '/auth/me/';
  static const measurements = '/auth/me/measurements/';
  static String user(String id) => '/users/$id';
}

