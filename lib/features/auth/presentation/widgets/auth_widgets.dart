import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class BlackTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  const BlackTextField({
    required this.controller,
    required this.label,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      style: context.appTextTheme.bodyMedium?.copyWith(color: cs.onSurface),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: suffixIcon,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.onSurface, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.error, width: 1.5),
        ),
        filled: false,
      ),
    );
  }
}

class BlackButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const BlackButton({
    required this.label,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return SizedBox(
      height: AppSizes.buttonHeightLarge,
      child: Material(
        color: cs.onSurface,
        borderRadius: AppRadius.circular12,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: AppRadius.circular12,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: cs.surface,
                    ),
                  )
                : Text(
                    label,
                    style: context.appTextTheme.bodyMedium?.copyWith(
                      color: cs.surface,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
