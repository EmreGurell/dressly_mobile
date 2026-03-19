import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';
import 'package:ai_try_on/features/tryon/domain/usecases/tryon_usecases.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_event.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_state.dart';

class TryonBloc extends Bloc<TryonEvent, TryonState> {
  final TryOnUseCase _tryOn;

  TryonBloc({required TryOnUseCase tryOn})
      : _tryOn = tryOn,
        super(const TryonState.initial()) {
    on<TryonEvent>((event, emit) async {
      await event.when(
        photoSelected: (photo) => _onPhotoSelected(photo, emit),
        tryOnRequested: (productId) => _onTryOnRequested(productId, emit),
        saveResult: (imageUrl) => _onSaveResult(imageUrl, emit),
        reset: () => _onReset(emit),
      );
    });
  }

  Future<void> _onPhotoSelected(photo, Emitter<TryonState> emit) async {
    emit(TryonState.photoSelected(photo));
  }

  Future<void> _onTryOnRequested(int productId, Emitter<TryonState> emit) async {
    final photo = state.maybeWhen(
      photoSelected: (p) => p,
      orElse: () => null,
    );
    if (photo == null) return;

    emit(TryonState.loading(photo));
    final result = await _tryOn(userPhoto: photo, productId: productId);
    result.fold(
      (failure) => emit(TryonState.error(failure.message)),
      (tryonResult) => emit(TryonState.success(tryonResult)),
    );
  }

  Future<void> _onSaveResult(String imageUrl, Emitter<TryonState> emit) async {
    try {
      final response = await Dio().get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = Uint8List.fromList(response.data!);
      await Gal.putImageBytes(bytes);
      emit(const TryonState.resultSaved());
    } catch (_) {
      emit(const TryonState.error('Görsel kaydedilemedi.'));
    }
  }

  Future<void> _onReset(Emitter<TryonState> emit) async {
    emit(const TryonState.initial());
  }
}
