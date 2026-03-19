import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

part 'saved_state.freezed.dart';

@freezed
sealed class SavedState with _$SavedState {
  const factory SavedState.initial() = _Initial;
  const factory SavedState.loading() = _Loading;
  const factory SavedState.loaded(List<Product> products) = _Loaded;
  const factory SavedState.error(String message) = _Error;
}
