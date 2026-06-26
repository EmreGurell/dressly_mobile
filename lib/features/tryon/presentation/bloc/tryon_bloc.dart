import 'dart:async';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';
import 'package:ai_try_on/features/tryon/domain/usecases/tryon_usecases.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_event.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_state.dart';

class TryonBloc extends Bloc<TryonEvent, TryonState> {
  final CreateTryOnUseCase _createTryOn;
  final GetTryOnStatusUseCase _getTryOnStatus;
  Timer? _pollingTimer;

  TryonBloc({
    required CreateTryOnUseCase createTryOn,
    required GetTryOnStatusUseCase getTryOnStatus,
  })  : _createTryOn = createTryOn,
        _getTryOnStatus = getTryOnStatus,
        super(const TryonState.initial()) {
    on<TryonEvent>((event, emit) async {
      await event.when(
        photoSelected: (photo) => _onPhotoSelected(photo, emit),
        tryOnRequested: (productId) => _onTryOnRequested(productId, emit),
        pollStatus: (tryonId) => _onPollStatus(tryonId, emit),
        saveResult: () => _onSaveResult(emit),
        reset: () => _onReset(emit),
      );
    });
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  Future<void> _onPhotoSelected(photo, Emitter<TryonState> emit) async {
    emit(TryonState.photoSelected(photo));
  }

  Future<void> _onTryOnRequested(
    int productId,
    Emitter<TryonState> emit,
  ) async {
    final photo = state.maybeWhen(
      photoSelected: (p) => p,
      orElse: () => null,
    );
    if (photo == null) return;

    emit(TryonState.loading(photo));

    final result = await _createTryOn(productId: productId, userPhoto: photo);

    result.fold(
      (failure) => emit(TryonState.error(failure.message)),
      (tryonResult) {
        if (tryonResult.status == 'completed') {
          emit(TryonState.success(tryonResult));
        } else if (tryonResult.status == 'failed') {
          emit(TryonState.error(tryonResult.errorMessage ?? 'Try-on başarısız oldu.'));
        } else {
          emit(TryonState.polling(photo, tryonResult));
          _startPolling(tryonResult.id);
        }
      },
    );
  }

  Future<void> _onPollStatus(
    int tryonId,
    Emitter<TryonState> emit,
  ) async {
    final result = await _getTryOnStatus(tryonId);

    result.fold(
      (failure) {
        _pollingTimer?.cancel();
        emit(TryonState.error(failure.message));
      },
      (tryonResult) {
        if (tryonResult.status == 'completed') {
          _pollingTimer?.cancel();
          emit(TryonState.success(tryonResult));
        } else if (tryonResult.status == 'failed') {
          _pollingTimer?.cancel();
          emit(TryonState.error(tryonResult.errorMessage ?? 'Try-on başarısız oldu.'));
        }
        // pending/processing durumlarında state'i güncelleme — mevcut polling state korunur
      },
    );
  }

  Future<void> _onSaveResult(Emitter<TryonState> emit) async {
    final url = state.maybeWhen(
      success: (result) => result.resultImageUrl,
      orElse: () => null,
    );
    if (url == null || url.isEmpty) return;

    try {
      final response = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      await Gal.putImageBytes(Uint8List.fromList(response.data!));
      emit(const TryonState.resultSaved());
    } catch (_) {
      emit(const TryonState.error('Görsel kaydedilemedi.'));
    }
  }

  Future<void> _onReset(Emitter<TryonState> emit) async {
    _pollingTimer?.cancel();
    emit(const TryonState.initial());
  }

  void _startPolling(int tryonId) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => add(TryonEvent.pollStatus(tryonId)),
    );
  }
}
