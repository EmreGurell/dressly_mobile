import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'tryon_event.freezed.dart';

@freezed
sealed class TryonEvent with _$TryonEvent {
  const factory TryonEvent.photoSelected(XFile photo) = _PhotoSelected;
  const factory TryonEvent.tryOnRequested(int productId) = _TryOnRequested;
  const factory TryonEvent.pollStatus(int tryonId) = _PollStatus;
  const factory TryonEvent.saveResult() = _SaveResult;
  const factory TryonEvent.reset() = _Reset;
}
