import 'package:get_it/get_it.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:ai_try_on/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:ai_try_on/features/auth/data/datasources/remote/auth_remote_datasource_impl.dart';
import 'package:ai_try_on/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_try_on/features/auth/domain/repositories/auth_repository.dart';
import 'package:ai_try_on/features/auth/domain/usecases/auth_usecases.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/feed/data/datasources/remote/feed_remote_datasource.dart';
import 'package:ai_try_on/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:ai_try_on/features/feed/domain/repositories/feed_repository.dart';
import 'package:ai_try_on/features/feed/domain/usecases/feed_usecases.dart';
import 'package:ai_try_on/features/saved/data/datasources/remote/saved_remote_datasource.dart';
import 'package:ai_try_on/features/saved/data/repositories/saved_repository_impl.dart';
import 'package:ai_try_on/features/saved/domain/repositories/saved_repository.dart';
import 'package:ai_try_on/features/saved/domain/usecases/saved_usecases.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:ai_try_on/features/brands/data/datasources/remote/brands_remote_datasource.dart';
import 'package:ai_try_on/features/brands/data/repositories/brands_repository_impl.dart';
import 'package:ai_try_on/features/brands/domain/repositories/brands_repository.dart';
import 'package:ai_try_on/features/brands/domain/usecases/brands_usecases.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_bloc.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_bloc.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:ai_try_on/features/tryon/data/datasources/remote/tryon_django_datasource.dart';
import 'package:ai_try_on/features/tryon/data/datasources/remote/tryon_remote_datasource.dart';
import 'package:ai_try_on/features/tryon/data/repositories/tryon_repository_impl.dart';
import 'package:ai_try_on/features/tryon/domain/repositories/tryon_repository.dart';
import 'package:ai_try_on/features/tryon/domain/usecases/tryon_usecases.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_bloc.dart';
import 'package:ai_try_on/features/product_detail/data/datasources/remote/product_detail_remote_datasource.dart';
import 'package:ai_try_on/features/product_detail/data/repositories/product_detail_repository_impl.dart';
import 'package:ai_try_on/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:ai_try_on/features/product_detail/domain/usecases/get_product_detail_usecase.dart';
import 'package:ai_try_on/features/product_detail/presentation/bloc/product_detail_bloc.dart';
import 'package:ai_try_on/features/notifications/data/datasources/remote/notification_remote_datasource.dart';
import 'package:ai_try_on/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:ai_try_on/features/notifications/domain/repositories/notification_repository.dart';
import 'package:ai_try_on/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:ai_try_on/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:ai_try_on/shared/cubit/theme_cubit.dart';
import 'package:ai_try_on/shared/services/auth_service.dart';
import 'package:ai_try_on/shared/services/push_notification_service.dart';
import 'package:ai_try_on/shared/services/secure_storage_service.dart';
import 'package:ai_try_on/shared/services/storage_service.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Services
  final secureStorage = SecureStorageService();
  await secureStorage.getToken(); // cache token on startup
  sl.registerSingleton<SecureStorageService>(secureStorage);

  final storageService = StorageService();
  await storageService.init();
  sl.registerSingleton<StorageService>(storageService);

  // Network
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Theme
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit(sl()));

  // Auth Service
  sl.registerLazySingleton<AuthService>(() => AuthService(sl(), sl()));

  // Push Notifications
  sl.registerLazySingleton<PushNotificationService>(() => PushNotificationService());

  // Auth Feature
  _registerAuth();

  // Feed Feature
  _registerFeed();

  // Saved Feature
  _registerSaved();

  // Brands Feature
  _registerBrands();

  // TryOn Feature
  _registerTryOn();

  // Product Detail Feature
  _registerProductDetail();

  // Notifications Feature
  _registerNotifications();
}

void _registerAuth() {
  // Datasources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl(), sl()),
  );

  // UseCases
  sl.registerFactory(() => LoginUseCase(sl()));
  sl.registerFactory(() => RegisterUseCase(sl()));
  sl.registerFactory(() => LoginWithGoogleUseCase(sl()));
  sl.registerFactory(() => LoginWithAppleUseCase(sl()));
  sl.registerFactory(() => LogoutUseCase(sl()));
  sl.registerFactory(() => GetMeUseCase(sl()));
  sl.registerFactory(() => UpdateMeasurementsUseCase(sl()));
  sl.registerFactory(() => ForgotPasswordUseCase(sl()));

  // Bloc
  sl.registerLazySingleton(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      loginWithGoogleUseCase: sl(),
      loginWithAppleUseCase: sl(),
      logoutUseCase: sl(),
      getMeUseCase: sl(),
      updateMeasurementsUseCase: sl(),
      forgotPasswordUseCase: sl(),
    ),
  );
}

void _registerSaved() {
  sl.registerLazySingleton<SavedRemoteDataSource>(
    () => SavedRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SavedRepository>(
    () => SavedRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetSavedUseCase(sl()));
  sl.registerFactory(() => RemoveSavedUseCase(sl()));
  sl.registerFactory(
    () => SavedBloc(getSaved: sl(), removeSaved: sl()),
  );
}

void _registerBrands() {
  sl.registerLazySingleton<BrandsRemoteDataSource>(
    () => BrandsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<BrandsRepository>(
    () => BrandsRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetBrandsUseCase(sl()));
  sl.registerFactory(() => GetProductsUseCase(sl()));
  sl.registerFactory(() => GetBrandProductsUseCase(sl()));
  sl.registerFactory(
    () => BrandsBloc(getBrands: sl(), getProducts: sl(), getBrandProducts: sl()),
  );
  sl.registerFactory(
    () => BrandDetailBloc(getBrandProducts: sl()),
  );
}

void _registerTryOn() {
  sl.registerLazySingleton<TryonRemoteDataSource>(
    () => DjangoTryonDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TryonRepository>(
    () => TryonRepositoryImpl(sl()),
  );
  sl.registerFactory(() => CreateTryOnUseCase(sl()));
  sl.registerFactory(() => GetTryOnStatusUseCase(sl()));
  sl.registerFactory(() => ListTryOnsUseCase(sl()));
  sl.registerFactory(
    () => TryonBloc(createTryOn: sl(), getTryOnStatus: sl()),
  );
}

void _registerProductDetail() {
  sl.registerLazySingleton<ProductDetailRemoteDataSource>(
    () => ProductDetailRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductDetailRepository>(
    () => ProductDetailRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetProductDetailUseCase(sl()));
  sl.registerFactory(
    () => ProductDetailBloc(
      getProductDetail: sl(),
      likeProduct: sl(),
      saveProduct: sl(),
    ),
  );
}

void _registerNotifications() {
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl()),
  );
  sl.registerFactory(() => ListNotificationsUseCase(sl()));
  sl.registerFactory(() => GetUnreadCountUseCase(sl()));
  sl.registerFactory(() => MarkReadUseCase(sl()));
  sl.registerFactory(() => MarkAllReadUseCase(sl()));
  sl.registerFactory(() => RegisterDeviceTokenUseCase(sl()));
  sl.registerFactory(() => RemoveDeviceTokenUseCase(sl()));
  sl.registerLazySingleton(
    () => NotificationBloc(
      listNotifications: sl(),
      getUnreadCount: sl(),
      markRead: sl(),
      markAllRead: sl(),
    ),
  );
}

void _registerFeed() {
  sl.registerLazySingleton<FeedRemoteDataSource>(
    () => FeedRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetFeedUseCase(sl()));
  sl.registerFactory(() => LikeProductUseCase(sl()));
  sl.registerFactory(() => SaveProductUseCase(sl()));
  sl.registerFactory(() => RefreshFeedUseCase(sl()));
  sl.registerFactory(() => GetRecommendationsUseCase(sl()));
  sl.registerLazySingleton(
    () => FeedBloc(
      getFeed: sl(),
      likeProduct: sl(),
      saveProduct: sl(),
      refreshFeed: sl(),
    ),
  );
}

