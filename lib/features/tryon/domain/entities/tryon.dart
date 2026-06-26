import 'package:freezed_annotation/freezed_annotation.dart';

part 'tryon.freezed.dart';

@freezed
sealed class TryonResult with _$TryonResult {
  const factory TryonResult({
    required int id,
    required int productId,
    required String productName,
    required String productImageUrl,
    required String userPhotoUrl,
    required String status,
    String? resultImageUrl,
    String? errorMessage,
    required String createdAt,
  }) = _TryonResult;
}
