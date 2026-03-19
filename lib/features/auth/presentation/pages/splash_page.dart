import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/shared/services/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    final isAuth = sl<AuthService>().isAuthenticated;
    if (isAuth) {
      sl<AuthBloc>().add(const AuthEvent.getMeRequested());
    }
    context.go(isAuth ? AppRoutes.feed : AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 80),
      ),
    );
  }
}
