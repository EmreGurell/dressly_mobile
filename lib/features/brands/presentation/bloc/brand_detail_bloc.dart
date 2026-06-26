import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/domain/usecases/brands_usecases.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_event.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_state.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

class BrandDetailBloc extends Bloc<BrandDetailEvent, BrandDetailState> {
  final GetBrandProductsUseCase _getBrandProducts;
  String? _search;

  BrandDetailBloc({required GetBrandProductsUseCase getBrandProducts})
      : _getBrandProducts = getBrandProducts,
        super(const BrandDetailState.initial()) {
    on<BrandDetailEvent>((event, emit) async {
      await event.when(
        load: (brand) => _onLoad(brand, emit),
        selectCategory: (category) => _onSelectCategory(category, emit),
        loadMore: () => _onLoadMore(emit),
        search: (query) => _onSearch(query, emit),
      );
    });
  }

  Future<void> _onSearch(String query, Emitter<BrandDetailState> emit) async {
    _search = query.isEmpty ? null : query;
    final current = state.maybeWhen(
      loaded: (brand, products, categories, selectedCategory, page, hasMore, isLoadingMore) =>
          (brand: brand, products: products, categories: categories, selectedCategory: selectedCategory),
      orElse: () => null,
    );
    if (current == null) return;

    emit(BrandDetailState.loaded(
      brand: current.brand,
      products: current.products,
      categories: current.categories,
      selectedCategory: current.selectedCategory,
      currentPage: 1,
      hasMore: false,
      isLoadingMore: true,
    ));

    final result = await _getBrandProducts(
      current.brand.id,
      1,
      category: current.selectedCategory,
      search: _search,
    );
    result.fold(
      (failure) => emit(BrandDetailState.loaded(
        brand: current.brand,
        products: current.products,
        categories: current.categories,
        selectedCategory: current.selectedCategory,
        currentPage: 1,
        hasMore: false,
        isLoadingMore: false,
      )),
      (products) => emit(BrandDetailState.loaded(
        brand: current.brand,
        products: products,
        categories: current.categories,
        selectedCategory: current.selectedCategory,
        currentPage: 1,
        hasMore: products.length >= 20,
      )),
    );
  }

  Future<void> _onLoad(Brand brand, Emitter<BrandDetailState> emit) async {
    _search = null;
    emit(const BrandDetailState.loading());
    final result = await _getBrandProducts(brand.id, 1, search: _search);
    result.fold(
      (failure) => emit(BrandDetailState.error(failure.message)),
      (products) {
        final categories = _extractCategories(products);
        emit(BrandDetailState.loaded(
          brand: brand,
          products: products,
          categories: categories,
          selectedCategory: null,
          currentPage: 1,
          hasMore: products.length >= 20,
        ));
      },
    );
  }

  Future<void> _onSelectCategory(
    String? category,
    Emitter<BrandDetailState> emit,
  ) async {
    final current = state.maybeWhen(
      loaded: (brand, products, categories, selectedCategory, page, hasMore, isLoadingMore) =>
          (brand: brand, products: products, categories: categories),
      orElse: () => null,
    );
    if (current == null) return;

    // Seçili kategoriyi hemen göster, mevcut ürünleri koru (full-screen loading yok)
    emit(BrandDetailState.loaded(
      brand: current.brand,
      products: current.products,
      categories: current.categories,
      selectedCategory: category,
      currentPage: 1,
      hasMore: false,
      isLoadingMore: true,
    ));

    final result = await _getBrandProducts(
      current.brand.id,
      1,
      category: category,
      search: _search,
    );
    result.fold(
      (failure) => emit(BrandDetailState.loaded(
        brand: current.brand,
        products: current.products,
        categories: current.categories,
        selectedCategory: category,
        currentPage: 1,
        hasMore: false,
      )),
      (products) => emit(BrandDetailState.loaded(
        brand: current.brand,
        products: products,
        categories: current.categories,
        selectedCategory: category,
        currentPage: 1,
        hasMore: products.length >= 20,
      )),
    );
  }

  Future<void> _onLoadMore(Emitter<BrandDetailState> emit) async {
    final current = state.maybeWhen(
      loaded: (brand, products, categories, selectedCategory, page, hasMore, isLoadingMore) =>
          hasMore && !isLoadingMore
              ? (
                  brand: brand,
                  products: products,
                  categories: categories,
                  selectedCategory: selectedCategory,
                  page: page,
                )
              : null,
      orElse: () => null,
    );
    if (current == null) return;

    // Mark as loading more
    emit(BrandDetailState.loaded(
      brand: current.brand,
      products: current.products,
      categories: current.categories,
      selectedCategory: current.selectedCategory,
      currentPage: current.page,
      hasMore: true,
      isLoadingMore: true,
    ));

    final result = await _getBrandProducts(
      current.brand.id,
      current.page + 1,
      category: current.selectedCategory,
      search: _search,
    );
    result.fold(
      (failure) => emit(BrandDetailState.loaded(
        brand: current.brand,
        products: current.products,
        categories: current.categories,
        selectedCategory: current.selectedCategory,
        currentPage: current.page,
        hasMore: true,
        isLoadingMore: false,
      )),
      (newProducts) => emit(BrandDetailState.loaded(
        brand: current.brand,
        products: [...current.products, ...newProducts],
        categories: current.categories,
        selectedCategory: current.selectedCategory,
        currentPage: current.page + 1,
        hasMore: newProducts.length >= 20,
      )),
    );
  }

  List<String> _extractCategories(List<Product> products) {
    final seen = <String>{};
    return products.map((p) => p.category).where(seen.add).toList();
  }
}
