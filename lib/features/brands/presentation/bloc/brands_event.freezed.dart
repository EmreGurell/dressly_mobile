// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brands_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BrandsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandsEvent()';
  }
}

/// @nodoc
class $BrandsEventCopyWith<$Res> {
  $BrandsEventCopyWith(BrandsEvent _, $Res Function(BrandsEvent) __);
}

/// Adds pattern-matching-related methods to [BrandsEvent].
extension BrandsEventPatterns on BrandsEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBrands value)? fetchBrands,
    TResult Function(_SelectAllBrands value)? selectAllBrands,
    TResult Function(_SelectBrand value)? selectBrand,
    TResult Function(_SelectCategory value)? selectCategory,
    TResult Function(_LoadMoreProducts value)? loadMoreProducts,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchBrands() when fetchBrands != null:
        return fetchBrands(_that);
      case _SelectAllBrands() when selectAllBrands != null:
        return selectAllBrands(_that);
      case _SelectBrand() when selectBrand != null:
        return selectBrand(_that);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts(_that);
      case _Search() when search != null:
        return search(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBrands value) fetchBrands,
    required TResult Function(_SelectAllBrands value) selectAllBrands,
    required TResult Function(_SelectBrand value) selectBrand,
    required TResult Function(_SelectCategory value) selectCategory,
    required TResult Function(_LoadMoreProducts value) loadMoreProducts,
    required TResult Function(_Search value) search,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchBrands():
        return fetchBrands(_that);
      case _SelectAllBrands():
        return selectAllBrands(_that);
      case _SelectBrand():
        return selectBrand(_that);
      case _SelectCategory():
        return selectCategory(_that);
      case _LoadMoreProducts():
        return loadMoreProducts(_that);
      case _Search():
        return search(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBrands value)? fetchBrands,
    TResult? Function(_SelectAllBrands value)? selectAllBrands,
    TResult? Function(_SelectBrand value)? selectBrand,
    TResult? Function(_SelectCategory value)? selectCategory,
    TResult? Function(_LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(_Search value)? search,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchBrands() when fetchBrands != null:
        return fetchBrands(_that);
      case _SelectAllBrands() when selectAllBrands != null:
        return selectAllBrands(_that);
      case _SelectBrand() when selectBrand != null:
        return selectBrand(_that);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts(_that);
      case _Search() when search != null:
        return search(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBrands,
    TResult Function()? selectAllBrands,
    TResult Function(Brand brand)? selectBrand,
    TResult Function(String? category)? selectCategory,
    TResult Function()? loadMoreProducts,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchBrands() when fetchBrands != null:
        return fetchBrands();
      case _SelectAllBrands() when selectAllBrands != null:
        return selectAllBrands();
      case _SelectBrand() when selectBrand != null:
        return selectBrand(_that.brand);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that.category);
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts();
      case _Search() when search != null:
        return search(_that.query);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBrands,
    required TResult Function() selectAllBrands,
    required TResult Function(Brand brand) selectBrand,
    required TResult Function(String? category) selectCategory,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query) search,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchBrands():
        return fetchBrands();
      case _SelectAllBrands():
        return selectAllBrands();
      case _SelectBrand():
        return selectBrand(_that.brand);
      case _SelectCategory():
        return selectCategory(_that.category);
      case _LoadMoreProducts():
        return loadMoreProducts();
      case _Search():
        return search(_that.query);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBrands,
    TResult? Function()? selectAllBrands,
    TResult? Function(Brand brand)? selectBrand,
    TResult? Function(String? category)? selectCategory,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query)? search,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchBrands() when fetchBrands != null:
        return fetchBrands();
      case _SelectAllBrands() when selectAllBrands != null:
        return selectAllBrands();
      case _SelectBrand() when selectBrand != null:
        return selectBrand(_that.brand);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that.category);
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts();
      case _Search() when search != null:
        return search(_that.query);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FetchBrands implements BrandsEvent {
  const _FetchBrands();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchBrands);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandsEvent.fetchBrands()';
  }
}

/// @nodoc

class _SelectAllBrands implements BrandsEvent {
  const _SelectAllBrands();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SelectAllBrands);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandsEvent.selectAllBrands()';
  }
}

/// @nodoc

class _SelectBrand implements BrandsEvent {
  const _SelectBrand(this.brand);

  final Brand brand;

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectBrandCopyWith<_SelectBrand> get copyWith =>
      __$SelectBrandCopyWithImpl<_SelectBrand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectBrand &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brand);

  @override
  String toString() {
    return 'BrandsEvent.selectBrand(brand: $brand)';
  }
}

/// @nodoc
abstract mixin class _$SelectBrandCopyWith<$Res>
    implements $BrandsEventCopyWith<$Res> {
  factory _$SelectBrandCopyWith(
          _SelectBrand value, $Res Function(_SelectBrand) _then) =
      __$SelectBrandCopyWithImpl;
  @useResult
  $Res call({Brand brand});

  $BrandCopyWith<$Res> get brand;
}

/// @nodoc
class __$SelectBrandCopyWithImpl<$Res> implements _$SelectBrandCopyWith<$Res> {
  __$SelectBrandCopyWithImpl(this._self, this._then);

  final _SelectBrand _self;
  final $Res Function(_SelectBrand) _then;

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brand = null,
  }) {
    return _then(_SelectBrand(
      null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand,
    ));
  }

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res> get brand {
    return $BrandCopyWith<$Res>(_self.brand, (value) {
      return _then(_self.copyWith(brand: value));
    });
  }
}

/// @nodoc

class _SelectCategory implements BrandsEvent {
  const _SelectCategory(this.category);

  final String? category;

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCategoryCopyWith<_SelectCategory> get copyWith =>
      __$SelectCategoryCopyWithImpl<_SelectCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectCategory &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'BrandsEvent.selectCategory(category: $category)';
  }
}

/// @nodoc
abstract mixin class _$SelectCategoryCopyWith<$Res>
    implements $BrandsEventCopyWith<$Res> {
  factory _$SelectCategoryCopyWith(
          _SelectCategory value, $Res Function(_SelectCategory) _then) =
      __$SelectCategoryCopyWithImpl;
  @useResult
  $Res call({String? category});
}

/// @nodoc
class __$SelectCategoryCopyWithImpl<$Res>
    implements _$SelectCategoryCopyWith<$Res> {
  __$SelectCategoryCopyWithImpl(this._self, this._then);

  final _SelectCategory _self;
  final $Res Function(_SelectCategory) _then;

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_SelectCategory(
      freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _LoadMoreProducts implements BrandsEvent {
  const _LoadMoreProducts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandsEvent.loadMoreProducts()';
  }
}

/// @nodoc

class _Search implements BrandsEvent {
  const _Search(this.query);

  final String query;

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Search &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'BrandsEvent.search(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res>
    implements $BrandsEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) =
      __$SearchCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

  /// Create a copy of BrandsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_Search(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
