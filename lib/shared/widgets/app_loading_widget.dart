import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  final double? size;
  const AppLoadingWidget({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 36,
        height: size ?? 36,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

