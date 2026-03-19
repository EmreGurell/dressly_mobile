import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const circular4 = BorderRadius.all(Radius.circular(4));
  static const circular8 = BorderRadius.all(Radius.circular(8));
  static const circular12 = BorderRadius.all(Radius.circular(12));
  static const circular16 = BorderRadius.all(Radius.circular(16));
  static const circular20 = BorderRadius.all(Radius.circular(20));
  static const circular24 = BorderRadius.all(Radius.circular(24));
  static const circular32 = BorderRadius.all(Radius.circular(32));
  static const circular100 = BorderRadius.all(Radius.circular(100));

  static const top8 = BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  );
  static const top12 = BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  );
  static const top16 = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  );
  static const top24 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
}

