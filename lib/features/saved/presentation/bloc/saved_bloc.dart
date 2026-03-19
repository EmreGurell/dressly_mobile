import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/saved/domain/usecases/saved_usecases.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_event.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final GetSavedUseCase _getSaved;
  final RemoveSavedUseCase _removeSaved;

  SavedBloc({
    required GetSavedUseCase getSaved,
    required RemoveSavedUseCase removeSaved,
  })  : _getSaved = getSaved,
        _removeSaved = removeSaved,
        super(const SavedState.initial()) {
    on<SavedEvent>((event, emit) async {
      await event.when(
        fetchSaved: () => _onFetchSaved(emit),
        removeProduct: (id) => _onRemoveProduct(id, emit),
      );
    });
  }

  Future<void> _onFetchSaved(Emitter<SavedState> emit) async {
    emit(const SavedState.loading());
    final result = await _getSaved();
    result.fold(
      (failure) => emit(SavedState.error(failure.message)),
      (products) => emit(SavedState.loaded(products)),
    );
  }

  Future<void> _onRemoveProduct(int productId, Emitter<SavedState> emit) async {
    // Optimistic: listeden hemen kaldır
    final current = state.maybeWhen(
      loaded: (products) => products,
      orElse: () => null,
    );
    if (current == null) return;

    emit(SavedState.loaded(current.where((p) => p.id != productId).toList()));
    await _removeSaved(productId);
  }
}
