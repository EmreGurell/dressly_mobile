import 'package:flutter/material.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class MeasurementsBottomSheet extends StatefulWidget {
  final User user;
  const MeasurementsBottomSheet({super.key, required this.user});

  static Future<void> show(BuildContext context, User user) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.top24),
      builder: (_) => MeasurementsBottomSheet(user: user),
    );
  }

  @override
  State<MeasurementsBottomSheet> createState() => _MeasurementsBottomSheetState();
}

class _MeasurementsBottomSheetState extends State<MeasurementsBottomSheet> {
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  late final TextEditingController _chestController;
  late final TextEditingController _waistController;
  late final TextEditingController _hipsController;
  String? _selectedSize;

  static const _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  @override
  void initState() {
    super.initState();
    final u = widget.user;
    _heightController = TextEditingController(text: _fmt(u.heightCm));
    _weightController = TextEditingController(text: _fmt(u.weightKg));
    _chestController  = TextEditingController(text: _fmt(u.chestCm));
    _waistController  = TextEditingController(text: _fmt(u.waistCm));
    _hipsController   = TextEditingController(text: _fmt(u.hipsCm));
    _selectedSize = u.clothingSize;
  }

  String _fmt(double? v) => v != null ? v.toStringAsFixed(0) : '';

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _chestController.dispose();
    _waistController.dispose();
    _hipsController.dispose();
    super.dispose();
  }

  void _onSave() {
    sl<AuthBloc>().add(AuthEvent.updateMeasurementsRequested(
      heightCm: double.tryParse(_heightController.text),
      weightKg: double.tryParse(_weightController.text),
      chestCm:  double.tryParse(_chestController.text),
      waistCm:  double.tryParse(_waistController.text),
      hipsCm:   double.tryParse(_hipsController.text),
      clothingSize: _selectedSize,
    ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHandle(),
            Padding(
              padding: AppPadding.p24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ölçülerim',
                    style: context.appTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSizes.space4),
                  Text(
                    'Daha iyi sonuçlar için ölçülerini gir.',
                    style: context.appTextTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSizes.space24),
                  // Boy & Kilo
                  Row(
                    spacing: AppSizes.space12,
                    children: [
                      Expanded(
                        child: _MeasurementField(
                          controller: _heightController,
                          label: 'Boy',
                          suffix: 'cm',
                        ),
                      ),
                      Expanded(
                        child: _MeasurementField(
                          controller: _weightController,
                          label: 'Kilo',
                          suffix: 'kg',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.space16),
                  // Göğüs, Bel, Kalça
                  Row(
                    spacing: AppSizes.space12,
                    children: [
                      Expanded(
                        child: _MeasurementField(
                          controller: _chestController,
                          label: 'Göğüs',
                          suffix: 'cm',
                        ),
                      ),
                      Expanded(
                        child: _MeasurementField(
                          controller: _waistController,
                          label: 'Bel',
                          suffix: 'cm',
                        ),
                      ),
                      Expanded(
                        child: _MeasurementField(
                          controller: _hipsController,
                          label: 'Kalça',
                          suffix: 'cm',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.space20),
                  Text(
                    'Beden',
                    style: context.appTextTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSizes.space8),
                  Wrap(
                    spacing: AppSizes.space8,
                    runSpacing: AppSizes.space8,
                    children: _sizes.map((size) {
                      final isSelected = _selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedSize = size),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.space16,
                            vertical: AppSizes.space8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.colorScheme.primary
                                : context.colorScheme.surfaceContainerLow,
                            borderRadius: AppRadius.circular8,
                            border: Border.all(
                              color: isSelected
                                  ? context.colorScheme.primary
                                  : context.colorScheme.outlineVariant,
                            ),
                          ),
                          child: Text(
                            size,
                            style: context.appTextTheme.labelMedium?.copyWith(
                              color: isSelected
                                  ? context.colorScheme.onPrimary
                                  : context.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppSizes.space32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onSave,
                      child: const Text('Kaydet'),
                    ),
                  ),
                  const SizedBox(height: AppSizes.space8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: AppPadding.vertical12,
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: context.colorScheme.outlineVariant,
          borderRadius: AppRadius.circular100,
        ),
      ),
    );
  }
}

class _MeasurementField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String suffix;

  const _MeasurementField({
    required this.controller,
    required this.label,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
      ),
    );
  }
}
