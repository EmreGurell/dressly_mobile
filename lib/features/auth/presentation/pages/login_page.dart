import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_state.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (_) => context.go(AppRoutes.feed),
          error: (msg) => AppSnackbar.error(context, msg),
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              // ── Arka plan fotoğrafı ───────────────────────────────────
              Image.asset(
                'assets/images/login_bg.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const ColoredBox(color: Color(0xFF111111)),
              ),
              // ── Gradient overlay ──────────────────────────────────────
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.4, 0.72, 1.0],
                    colors: [
                      AppColors.black.withValues(alpha: 0.30),
                      AppColors.black.withValues(alpha: 0.18),
                      AppColors.black.withValues(alpha: 0.60),
                      AppColors.black.withValues(alpha: 0.95),
                    ],
                  ),
                ),
              ),
              // ── İçerik ───────────────────────────────────────────────
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // App adı — ortada
                    Expanded(
                      child: Center(
                        child: Text(
                          'DRESSLY',
                          style: context.appTextTheme.displaySmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: AppSizes.space4,
                          ),
                        ),
                      ),
                    ),
                    // Butonlar — altta
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _SocialButton(
                                logoAsset: 'assets/images/google_logo.png',
                                label: 'Google ile Giriş Yap',
                                isLoading: isLoading,
                                onTap: () => context.read<AuthBloc>().add(
                                      const AuthEvent
                                          .loginWithGoogleRequested(),
                                    ),
                              ),
                              const SizedBox(height: AppSizes.space12),
                              _SocialButton(
                                logoAsset: 'assets/images/apple_logo.png',
                                label: 'Apple ile Giriş Yap',
                                isLoading: isLoading,
                                onTap: () => context.read<AuthBloc>().add(
                                      const AuthEvent
                                          .loginWithAppleRequested(),
                                    ),
                              ),
                              const SizedBox(height: AppSizes.space20),
                              GestureDetector(
                                onTap: () =>
                                    context.push(AppRoutes.emailLogin),
                                child: Text(
                                  'E-posta ile giriş yap',
                                  style:
                                      context.appTextTheme.bodySmall?.copyWith(
                                    color:
                                        AppColors.white.withValues(alpha: 0.65),
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        AppColors.white.withValues(alpha: 0.65),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String logoAsset;
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const _SocialButton({
    required this.logoAsset,
    required this.label,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: AppRadius.circular100,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: AppRadius.circular100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logoAsset,
                width: 22,
                height: 22,
                errorBuilder: (_, __, ___) => const SizedBox(width: 22, height: 22),
              ),
              const SizedBox(width: AppSizes.space12),
              Text(
                label,
                style: context.appTextTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
