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

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  String? _gender;
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_gender == null) {
      AppSnackbar.error(context, 'Lütfen cinsiyetini seç');
      return;
    }
    context.read<AuthBloc>().add(
          AuthEvent.updateMeasurementsRequested(
            gender: _gender,
            heightCm: int.tryParse(_heightController.text.trim()),
            weightKg: int.tryParse(_weightController.text.trim()),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user) {
            if (user.isOnboarded) context.go(AppRoutes.feed);
          },
          error: (msg) => AppSnackbar.error(context, msg),
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppPadding.p24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSizes.space40),
                Text(
                  'Sana Özel Deneyim',
                  style: context.appTextTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: AppSizes.space8),
                Text(
                  'Cinsiyetini ve ölçülerini girerek moda önerilerini kişiselleştir.',
                  style: context.appTextTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSizes.space40),
                // Gender
                Text(
                  'Cinsiyet',
                  style: context.appTextTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: AppSizes.space12),
                _GenderSelector(
                  selected: _gender,
                  onSelected: (v) => setState(() => _gender = v),
                ),
                const SizedBox(height: AppSizes.space32),
                // Height
                Text(
                  'Ölçüler (opsiyonel)',
                  style: context.appTextTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: AppSizes.space12),
                Row(
                  spacing: AppSizes.space12,
                  children: [
                    Expanded(
                      child: _MeasurementField(
                        controller: _heightController,
                        label: 'Boy (cm)',
                        icon: PhosphorIcons.arrowsVertical(),
                      ),
                    ),
                    Expanded(
                      child: _MeasurementField(
                        controller: _weightController,
                        label: 'Kilo (kg)',
                        icon: PhosphorIcons.scales(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.space48),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading =
                        state.maybeWhen(loading: () => true, orElse: () => false);
                    return FilledButton(
                      onPressed: isLoading ? null : _onSave,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(AppSizes.buttonHeightLarge),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.circular12,
                        ),
                      ),
                      child: isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: cs.onPrimary,
                              ),
                            )
                          : const Text('Devam Et'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GenderSelector extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onSelected;
  const _GenderSelector({required this.selected, required this.onSelected});

  static const _options = [
    ('male', 'Erkek', PhosphorIconsRegular.genderMale),
    ('female', 'Kadın', PhosphorIconsRegular.genderFemale),
    ('unisex', 'Belirtmek İstemiyorum', PhosphorIconsRegular.genderNonbinary),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return Column(
      children: _options.map((opt) {
        final (value, label, icon) = opt;
        final isSelected = selected == value;
        return GestureDetector(
          onTap: () => onSelected(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.only(bottom: AppSizes.space8),
            padding: AppPadding.p16,
            decoration: BoxDecoration(
              color: isSelected ? cs.primaryContainer : cs.surfaceContainerLow,
              borderRadius: AppRadius.circular12,
              border: Border.all(
                color: isSelected ? cs.primary : cs.outlineVariant,
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                PhosphorIcon(
                  icon,
                  size: AppSizes.iconMedium,
                  color: isSelected ? cs.primary : cs.onSurfaceVariant,
                ),
                const SizedBox(width: AppSizes.space12),
                Text(
                  label,
                  style: context.appTextTheme.bodyMedium?.copyWith(
                    color: isSelected ? cs.primary : cs.onSurface,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                const Spacer(),
                if (isSelected)
                  PhosphorIcon(
                    PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                    color: cs.primary,
                    size: AppSizes.iconMedium,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _MeasurementField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final PhosphorIconData icon;
  const _MeasurementField({
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      style: TextStyle(color: cs.onSurface),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: PhosphorIcon(icon, size: 18, color: cs.onSurfaceVariant),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.onSurface, width: 1.5),
        ),
        filled: false,
      ),
    );
  }
}
