import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_event.freezed.dart';

@freezed
sealed class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.load(int productId) = _Load;
  const factory ProductDetailEvent.toggleLike() = _ToggleLike;
  const factory ProductDetailEvent.toggleSave() = _ToggleSave;
}
