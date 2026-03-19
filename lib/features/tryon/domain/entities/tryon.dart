import 'package:freezed_annotation/freezed_annotation.dart';

part 'tryon.freezed.dart';

@freezed
sealed class TryonResult with _$TryonResult {
  const factory TryonResult({
    required int id,
    required String resultImageUrl,
    required int productId,
  }) = _TryonResult;
}
