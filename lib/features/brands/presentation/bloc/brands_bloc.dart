import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/domain/usecases/brands_usecases.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_event.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_state.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetBrandsUseCase _getBrands;
  final GetProductsUseCase _getProducts;
  final GetBrandProductsUseCase _getBrandProducts;

  List<Brand> _brands = [];
  List<Product> _products = [];
  Brand? _selectedBrand;
  String? _selectedCategory;
  String? _search;
  int _currentPage = 1;
  bool _hasMore = false;

  BrandsBloc({
    required GetBrandsUseCase getBrands,
    required GetProductsUseCase getProducts,
    required GetBrandProductsUseCase getBrandProducts,
  })  : _getBrands = getBrands,
        _getProducts = getProducts,
        _getBrandProducts = getBrandProducts,
        super(const BrandsState.initial()) {
    on<BrandsEvent>((event, emit) async {
      await event.when(
        fetchBrands: () => _onFetchBrands(emit),
        selectAllBrands: () => _onSelectAllBrands(emit),
        selectBrand: (brand) => _onSelectBrand(brand, emit),
        selectCategory: (category) => _onSelectCategory(category, emit),
        loadMoreProducts: () => _onLoadMore(emit),
        search: (query) => _onSearch(query, emit),
      );
    });
  }

  BrandsState get _currentLoaded => BrandsState.loaded(
        brands: _brands,
        products: _products,
        selectedBrand: _selectedBrand,
        selectedCategory: _selectedCategory,
        currentPage: _currentPage,
        hasMore: _hasMore,
      );

  Future<void> _onFetchBrands(Emitter<BrandsState> emit) async {
    emit(const BrandsState.loading());
    final result = await _getBrands();
    result.fold(
      (failure) => emit(BrandsState.error(failure.message)),
      (brands) {
        _brands = brands;
        _selectedBrand = null;
        _products = [];
        _selectedCategory = null;
        _currentPage = 1;
        _hasMore = false;
        emit(_currentLoaded);
      },
    );
  }

  Future<void> _onSelectAllBrands(Emitter<BrandsState> emit) async {
    _selectedBrand = null;
    _selectedCategory = null;
    _search = null;
    _products = [];
    _currentPage = 1;
    _hasMore = false;
    emit(BrandsState.loaded(
      brands: _brands,
      products: [],
      selectedBrand: null,
      isLoadingProducts: true,
    ));
    await _fetchAllProducts(page: 1, emit: emit, replace: true);
  }

  Future<void> _onSelectBrand(Brand brand, Emitter<BrandsState> emit) async {
    _selectedBrand = brand;
    _selectedCategory = null;
    _search = null;
    _products = [];
    _currentPage = 1;
    _hasMore = false;
    emit(BrandsState.loaded(
      brands: _brands,
      products: [],
      selectedBrand: _selectedBrand,
      isLoadingProducts: true,
    ));
    await _fetchProducts(page: 1, emit: emit, replace: true);
  }

  Future<void> _onSelectCategory(
    String? category,
    Emitter<BrandsState> emit,
  ) async {
    _selectedCategory = category;
    if (_selectedBrand == null) {
      // All-products mode: local filter, no API call
      emit(_currentLoaded);
      return;
    }
    _search = null;
    _products = [];
    _currentPage = 1;
    _hasMore = false;
    emit(BrandsState.loaded(
      brands: _brands,
      products: [],
      selectedBrand: _selectedBrand,
      selectedCategory: _selectedCategory,
      isLoadingProducts: true,
    ));
    await _fetchProducts(page: 1, emit: emit, replace: true);
  }

  Future<void> _onLoadMore(Emitter<BrandsState> emit) async {
    if (!_hasMore) return;

    emit(BrandsState.loaded(
      brands: _brands,
      products: _products,
      selectedBrand: _selectedBrand,
      selectedCategory: _selectedCategory,
      currentPage: _currentPage,
      hasMore: _hasMore,
      isLoadingMore: true,
    ));

    if (_selectedBrand == null) {
      await _fetchAllProducts(page: _currentPage + 1, emit: emit, replace: false);
    } else {
      await _fetchProducts(page: _currentPage + 1, emit: emit, replace: false);
    }
  }

  Future<void> _onSearch(String query, Emitter<BrandsState> emit) async {
    _search = query.isEmpty ? null : query;
    _selectedCategory = null;
    _products = [];
    _currentPage = 1;
    _hasMore = false;
    emit(BrandsState.loaded(
      brands: _brands,
      products: [],
      selectedBrand: _selectedBrand,
      selectedCategory: null,
      isLoadingProducts: true,
    ));
    if (_selectedBrand == null) {
      await _fetchAllProducts(page: 1, emit: emit, replace: true);
    } else {
      await _fetchProducts(page: 1, emit: emit, replace: true);
    }
  }

  Future<void> _fetchAllProducts({
    required int page,
    required Emitter<BrandsState> emit,
    required bool replace,
  }) async {
    final result = await _getProducts(page, search: _search);
    result.fold(
      (failure) => emit(_currentLoaded),
      (newProducts) {
        _products = replace ? newProducts : [..._products, ...newProducts];
        _currentPage = page;
        _hasMore = newProducts.length >= 20;
        emit(_currentLoaded);
      },
    );
  }

  Future<void> _fetchProducts({
    required int page,
    required Emitter<BrandsState> emit,
    required bool replace,
  }) async {
    final result = await _getBrandProducts(
      _selectedBrand!.id,
      page,
      category: _selectedCategory,
      search: _search,
    );
    result.fold(
      (failure) => emit(_currentLoaded),
      (newProducts) {
        _products = replace ? newProducts : [..._products, ...newProducts];
        _currentPage = page;
        _hasMore = newProducts.length >= 20;
        emit(_currentLoaded);
      },
    );
  }
}
