import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';

part 'tryon_state.freezed.dart';

@freezed
sealed class TryonState with _$TryonState {
  const factory TryonState.initial() = _Initial;
  const factory TryonState.photoSelected(XFile photo) = _PhotoSelected;
  const factory TryonState.loading(XFile photo) = _Loading;
  const factory TryonState.success(TryonResult result) = _Success;
  const factory TryonState.resultSaved() = _ResultSaved;
  const factory TryonState.error(String message) = _Error;
}
