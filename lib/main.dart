import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_router.dart';
import 'package:ai_try_on/core/utils/logger/app_logger.dart';
import 'package:ai_try_on/shared/cubit/theme_cubit.dart';
import 'package:ai_try_on/shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  AppLogger.init();
  runApp(const OuranosApp());
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
            title: 'Ouranos',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: appRouter,
            localizationsDelegates: const [],
            supportedLocales: const [Locale('en')],
          );
        },
      ),
    );
  }
}
