import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_state.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_snackbar.dart';
import 'package:ai_try_on/features/auth/presentation/widgets/auth_widgets.dart';

class EmailLoginPage extends StatelessWidget {
  const EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: const _EmailLoginView(),
    );
  }
}

class _EmailLoginView extends StatefulWidget {
  const _EmailLoginView();

  @override
  State<_EmailLoginView> createState() => _EmailLoginViewState();
}

class _EmailLoginViewState extends State<_EmailLoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (_) => context.go(AppRoutes.feed),
          error: (msg) => AppSnackbar.error(context, msg),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cs.surface,
          leading: IconButton(
            icon: PhosphorIcon(PhosphorIcons.arrowLeft(), color: cs.onSurface),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.p24,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSizes.space16),
                    // Başlık
                    Text(
                      'Giriş Yap',
                      style: context.appTextTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: AppSizes.space8),
                    Text(
                      'Hesabına erişmek için\nbilgilerini gir.',
                      style: context.appTextTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppSizes.space40),
                    // Email
                    BlackTextField(
                      controller: _emailController,
                      label: 'E-posta',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          v?.isEmpty == true ? 'E-posta gerekli' : null,
                    ),
                    const SizedBox(height: AppSizes.space16),
                    // Şifre
                    BlackTextField(
                      controller: _passwordController,
                      label: 'Şifre',
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _onLogin(),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                        child: PhosphorIcon(
                          _obscurePassword
                              ? PhosphorIcons.eye()
                              : PhosphorIcons.eyeSlash(),
                          size: AppSizes.iconMedium,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                      validator: (v) =>
                          v?.isEmpty == true ? 'Şifre gerekli' : null,
                    ),
                    const SizedBox(height: AppSizes.space12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Şifremi unuttum',
                          style: context.appTextTheme.labelMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                            decoration: TextDecoration.underline,
                            decorationColor: cs.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.space32),
                    // Giriş butonu
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return BlackButton(
                          label: 'Giriş Yap',
                          isLoading: isLoading,
                          onTap: _onLogin,
                        );
                      },
                    ),
                    const SizedBox(height: AppSizes.space32),
                    // Kayıt ol
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hesabın yok mu? ',
                          style: context.appTextTheme.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.push(AppRoutes.register),
                          child: Text(
                            'Kayıt Ol',
                            style: context.appTextTheme.bodySmall?.copyWith(
                              color: cs.onSurface,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<AuthBloc>().add(
          AuthEvent.loginRequested(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }
}
