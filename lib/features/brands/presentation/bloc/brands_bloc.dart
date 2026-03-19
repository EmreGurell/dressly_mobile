import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/brands/domain/usecases/brands_usecases.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_event.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetBrandsUseCase _getBrands;

  BrandsBloc({required GetBrandsUseCase getBrands})
      : _getBrands = getBrands,
        super(const BrandsState.initial()) {
    on<BrandsEvent>((event, emit) async {
      await event.when(
        fetchBrands: () => _onFetchBrands(emit),
      );
    });
  }

  Future<void> _onFetchBrands(Emitter<BrandsState> emit) async {
    emit(const BrandsState.loading());
    final result = await _getBrands();
    result.fold(
      (failure) => emit(BrandsState.error(failure.message)),
      (brands) => emit(BrandsState.loaded(brands)),
    );
  }
}
