import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/shared/cubit/theme_cubit.dart';
import 'package:ai_try_on/shared/services/auth_service.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_state.dart';
import 'package:ai_try_on/features/profile/presentation/widgets/measurements_bottom_sheet.dart';
import 'package:ai_try_on/features/profile/presentation/widgets/profile_header.dart';
import 'package:ai_try_on/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    final bloc = sl<AuthBloc>();
    final isInitial =
        bloc.state.maybeWhen(initial: () => true, orElse: () => false);
    if (isInitial) {
      bloc.add(const AuthEvent.getMeRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return Scaffold(
      backgroundColor: cs.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(
          'Profil',
          style: context.appTextTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () {
              if (!sl<AuthService>().isAuthenticated) {
                context.go(AppRoutes.login);
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) => _buildContent(context, user),
            loading: () => const AppLoadingWidget(),
            unauthenticated: () => _buildRetry(context),
            error: (_) => _buildRetry(context),
            orElse: () => const AppLoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _buildRetry(BuildContext context) {
    return AppErrorWidget(
      message: 'Profil yüklenemedi',
      onRetry: () =>
          context.read<AuthBloc>().add(const AuthEvent.getMeRequested()),
    );
  }

  Widget _buildContent(BuildContext context, User user) {
    return ListView(
      children: [
        ProfileHeader(user: user),
        const SizedBox(height: AppSizes.space8),
        _SectionCard(
          children: [
            ProfileMenuItem(
              icon: PhosphorIcons.crown(PhosphorIconsStyle.fill),
              iconColor: AppColors.yellow,
              title: 'Abonelik',
              subtitle: 'Planını yönet',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: AppSizes.space8),
        _SectionCard(
          children: [
            ProfileMenuItem(
              icon: PhosphorIcons.ruler(),
              title: 'Ölçülerim',
              subtitle: 'Boy, kilo, beden',
              onTap: () => MeasurementsBottomSheet.show(context, user),
            ),
            _Divider(),
            ProfileMenuItem(
              icon: PhosphorIcons.bell(),
              title: 'Bildirimler',
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (val) =>
                    setState(() => _notificationsEnabled = val),
                activeColor: AppColors.primary,
              ),
            ),
            _Divider(),
            BlocBuilder<ThemeCubit, ThemeMode>(
              bloc: sl<ThemeCubit>(),
              builder: (context, themeMode) => ProfileMenuItem(
                icon: _themeIcon(themeMode),
                title: 'Tema',
                subtitle: _themeLabel(themeMode),
                onTap: () => _showThemeSheet(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.space8),
        _SectionCard(
          children: [
            ProfileMenuItem(
              icon: PhosphorIcons.signOut(),
              iconColor: AppColors.error,
              title: 'Çıkış Yap',
              trailing: const SizedBox.shrink(),
              onTap: () => context
                  .read<AuthBloc>()
                  .add(const AuthEvent.logoutRequested()),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.space32),
      ],
    );
  }

  PhosphorIconData _themeIcon(ThemeMode mode) => switch (mode) {
        ThemeMode.light => PhosphorIcons.sun(),
        ThemeMode.dark => PhosphorIcons.moon(),
        _ => PhosphorIcons.deviceMobile(),
      };

  String _themeLabel(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'Açık',
        ThemeMode.dark => 'Koyu',
        _ => 'Sistem',
      };

  void _showThemeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorScheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.top24),
      builder: (_) => _ThemeSheet(),
    );
  }
}

class _ThemeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = sl<ThemeCubit>();
    final current = cubit.state;
    final cs = context.colorScheme;

    final options = [
      (ThemeMode.system, PhosphorIcons.deviceMobile(), 'Sistem'),
      (ThemeMode.light, PhosphorIcons.sun(), 'Açık'),
      (ThemeMode.dark, PhosphorIcons.moon(), 'Koyu'),
    ];

    return SafeArea(
      child: Padding(
        padding: AppPadding.p24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema',
              style: context.appTextTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSizes.space16),
            ...options.map((opt) {
              final (mode, icon, label) = opt;
              final isSelected = current == mode;
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: PhosphorIcon(icon, color: cs.onSurface),
                title: Text(label,
                    style: context.appTextTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: cs.onSurface,
                    )),
                trailing: isSelected
                    ? PhosphorIcon(PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                        color: cs.primary)
                    : null,
                onTap: () {
                  cubit.setTheme(mode);
                  Navigator.of(context).pop();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final List<Widget> children;

  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: Divider(height: 1, color: context.colorScheme.outlineVariant),
    );
  }
}
