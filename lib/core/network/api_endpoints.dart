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
  static const products = '/products/';
  static const brands = '/products/brands/';
  static String brandProducts(int id) => '/products/brands/$id/products/';
  static String productDetail(int id) => '/products/$id/';

  // Try-On
  static const tryon = '/tryon/';
  static const tryonCreate = '/tryon/create/';
  static String tryonStatus(int id) => '/tryon/$id/status/';

  // Notifications
  static const deviceToken = '/notifications/device-token/';
  static const notifications = '/notifications/';
  static const notificationsUnreadCount = '/notifications/unread-count/';
  static String notificationRead(int id) => '/notifications/$id/read/';
  static const notificationsReadAll = '/notifications/read-all/';

  // Recommendations
  static const recommendations = '/recommendations/';

  // User
  static const me = '/auth/me/';
  static const measurements = '/auth/me/measurements/';
  static String user(String id) => '/users/$id';
}

