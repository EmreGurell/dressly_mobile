// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandDetailEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BrandDetailEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandDetailEvent()';
  }
}

/// @nodoc
class $BrandDetailEventCopyWith<$Res> {
  $BrandDetailEventCopyWith(
      BrandDetailEvent _, $Res Function(BrandDetailEvent) __);
}

/// Adds pattern-matching-related methods to [BrandDetailEvent].
extension BrandDetailEventPatterns on BrandDetailEvent {
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
    TResult Function(_Load value)? load,
    TResult Function(_SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case _LoadMore() when loadMore != null:
        return loadMore(_that);
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
    required TResult Function(_Load value) load,
    required TResult Function(_SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that);
      case _SelectCategory():
        return selectCategory(_that);
      case _LoadMore():
        return loadMore(_that);
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
    TResult? Function(_Load value)? load,
    TResult? Function(_SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case _LoadMore() when loadMore != null:
        return loadMore(_that);
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
    TResult Function(Brand brand)? load,
    TResult Function(String? category)? selectCategory,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that.brand);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that.category);
      case _LoadMore() when loadMore != null:
        return loadMore();
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
    required TResult Function(Brand brand) load,
    required TResult Function(String? category) selectCategory,
    required TResult Function() loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that.brand);
      case _SelectCategory():
        return selectCategory(_that.category);
      case _LoadMore():
        return loadMore();
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
    TResult? Function(Brand brand)? load,
    TResult? Function(String? category)? selectCategory,
    TResult? Function()? loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that.brand);
      case _SelectCategory() when selectCategory != null:
        return selectCategory(_that.category);
      case _LoadMore() when loadMore != null:
        return loadMore();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Load implements BrandDetailEvent {
  const _Load(this.brand);

  final Brand brand;

  /// Create a copy of BrandDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Load &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brand);

  @override
  String toString() {
    return 'BrandDetailEvent.load(brand: $brand)';
  }
}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res>
    implements $BrandDetailEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) =
      __$LoadCopyWithImpl;
  @useResult
  $Res call({Brand brand});

  $BrandCopyWith<$Res> get brand;
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

  /// Create a copy of BrandDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brand = null,
  }) {
    return _then(_Load(
      null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand,
    ));
  }

  /// Create a copy of BrandDetailEvent
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

class _SelectCategory implements BrandDetailEvent {
  const _SelectCategory(this.category);

  final String? category;

  /// Create a copy of BrandDetailEvent
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
    return 'BrandDetailEvent.selectCategory(category: $category)';
  }
}

/// @nodoc
abstract mixin class _$SelectCategoryCopyWith<$Res>
    implements $BrandDetailEventCopyWith<$Res> {
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

  /// Create a copy of BrandDetailEvent
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

class _LoadMore implements BrandDetailEvent {
  const _LoadMore();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandDetailEvent.loadMore()';
  }
}

// dart format on
