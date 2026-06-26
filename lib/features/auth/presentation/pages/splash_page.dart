import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_state.dart';
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
    if (!isAuth) {
      context.go(AppRoutes.login);
      return;
    }
    sl<AuthBloc>().add(const AuthEvent.getMeRequested());
    // Navigation handled by BlocListener below
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: sl<AuthBloc>(),
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user) => context.go(
            user.isOnboarded ? AppRoutes.feed : AppRoutes.onboarding,
          ),
          unauthenticated: () => context.go(AppRoutes.login),
          error: (_) => context.go(AppRoutes.login),
        );
      },
      child: const Scaffold(
        body: Center(
          child: FlutterLogo(size: 80),
        ),
      ),
    );
  }
}
