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

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
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
                      'Hesap Oluştur',
                      style: context.appTextTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: AppSizes.space8),
                    Text(
                      'Moda dünyasına katılmak için\nbilgilerini gir.',
                      style: context.appTextTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppSizes.space40),
                    // Ad Soyad
                    BlackTextField(
                      controller: _nameController,
                      label: 'Ad Soyad',
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          v?.isEmpty == true ? 'Ad gerekli' : null,
                    ),
                    const SizedBox(height: AppSizes.space16),
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
                      onFieldSubmitted: (_) => _onRegister(),
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
                      validator: (v) => (v?.length ?? 0) < 6
                          ? 'En az 6 karakter gerekli'
                          : null,
                    ),
                    const SizedBox(height: AppSizes.space32),
                    // Kayıt ol butonu
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return BlackButton(
                          label: 'Kayıt Ol',
                          isLoading: isLoading,
                          onTap: _onRegister,
                        );
                      },
                    ),
                    const SizedBox(height: AppSizes.space32),
                    // Giriş yap
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Zaten hesabın var mı? ',
                          style: context.appTextTheme.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Text(
                            'Giriş Yap',
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

  void _onRegister() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<AuthBloc>().add(
          AuthEvent.registerRequested(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            name: _nameController.text.trim(),
          ),
        );
  }
}
