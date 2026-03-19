import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_event.freezed.dart';

@freezed
sealed class SavedEvent with _$SavedEvent {
  const factory SavedEvent.fetchSaved() = _FetchSaved;
  const factory SavedEvent.removeProduct(int productId) = _RemoveProduct;
}
