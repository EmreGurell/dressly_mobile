import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/extensions/l10n_extension.dart';
import 'package:ai_try_on/core/router/app_router.dart';
import 'package:ai_try_on/core/utils/logger/app_logger.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_state.dart';
import 'package:ai_try_on/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:ai_try_on/shared/cubit/theme_cubit.dart';
import 'package:ai_try_on/shared/services/push_notification_service.dart';
import 'package:ai_try_on/shared/theme/app_theme.dart';

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  // Firebase is already initialized by the plugin in background isolate
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  await configureDependencies();
  AppLogger.init();
  _listenAuthForToken();
  runApp(const OuranosApp());
  // Push notification init runs after UI is ready (permission dialog + getInitialMessage)
  sl<PushNotificationService>().initialize();
}

void _listenAuthForToken() {
  sl<AuthBloc>().stream.listen((state) {
    state.whenOrNull(
      authenticated: (_) => sl<PushNotificationService>()
          .registerToken(sl<RegisterDeviceTokenUseCase>()),
      unauthenticated: () => sl<PushNotificationService>()
          .removeToken(sl<RemoveDeviceTokenUseCase>()),
    );
  });
}

class OuranosApp extends StatelessWidget {
  const OuranosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Dressly',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: appRouter,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
