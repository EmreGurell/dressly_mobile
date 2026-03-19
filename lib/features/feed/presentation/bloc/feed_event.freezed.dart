// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedEvent()';
  }
}

/// @nodoc
class $FeedEventCopyWith<$Res> {
  $FeedEventCopyWith(FeedEvent _, $Res Function(FeedEvent) __);
}

/// Adds pattern-matching-related methods to [FeedEvent].
extension FeedEventPatterns on FeedEvent {
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
    TResult Function(_LoadFeed value)? loadFeed,
    TResult Function(_RefreshFeed value)? refreshFeed,
    TResult Function(_LoadMoreFeed value)? loadMoreFeed,
    TResult Function(_LikeProduct value)? likeProduct,
    TResult Function(_SaveProduct value)? saveProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFeed() when loadFeed != null:
        return loadFeed(_that);
      case _RefreshFeed() when refreshFeed != null:
        return refreshFeed(_that);
      case _LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed(_that);
      case _LikeProduct() when likeProduct != null:
        return likeProduct(_that);
      case _SaveProduct() when saveProduct != null:
        return saveProduct(_that);
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
    required TResult Function(_LoadFeed value) loadFeed,
    required TResult Function(_RefreshFeed value) refreshFeed,
    required TResult Function(_LoadMoreFeed value) loadMoreFeed,
    required TResult Function(_LikeProduct value) likeProduct,
    required TResult Function(_SaveProduct value) saveProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFeed():
        return loadFeed(_that);
      case _RefreshFeed():
        return refreshFeed(_that);
      case _LoadMoreFeed():
        return loadMoreFeed(_that);
      case _LikeProduct():
        return likeProduct(_that);
      case _SaveProduct():
        return saveProduct(_that);
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
    TResult? Function(_LoadFeed value)? loadFeed,
    TResult? Function(_RefreshFeed value)? refreshFeed,
    TResult? Function(_LoadMoreFeed value)? loadMoreFeed,
    TResult? Function(_LikeProduct value)? likeProduct,
    TResult? Function(_SaveProduct value)? saveProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFeed() when loadFeed != null:
        return loadFeed(_that);
      case _RefreshFeed() when refreshFeed != null:
        return refreshFeed(_that);
      case _LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed(_that);
      case _LikeProduct() when likeProduct != null:
        return likeProduct(_that);
      case _SaveProduct() when saveProduct != null:
        return saveProduct(_that);
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
    TResult Function()? loadFeed,
    TResult Function()? refreshFeed,
    TResult Function()? loadMoreFeed,
    TResult Function(int productId)? likeProduct,
    TResult Function(int productId)? saveProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFeed() when loadFeed != null:
        return loadFeed();
      case _RefreshFeed() when refreshFeed != null:
        return refreshFeed();
      case _LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed();
      case _LikeProduct() when likeProduct != null:
        return likeProduct(_that.productId);
      case _SaveProduct() when saveProduct != null:
        return saveProduct(_that.productId);
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
    required TResult Function() loadFeed,
    required TResult Function() refreshFeed,
    required TResult Function() loadMoreFeed,
    required TResult Function(int productId) likeProduct,
    required TResult Function(int productId) saveProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFeed():
        return loadFeed();
      case _RefreshFeed():
        return refreshFeed();
      case _LoadMoreFeed():
        return loadMoreFeed();
      case _LikeProduct():
        return likeProduct(_that.productId);
      case _SaveProduct():
        return saveProduct(_that.productId);
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
    TResult? Function()? loadFeed,
    TResult? Function()? refreshFeed,
    TResult? Function()? loadMoreFeed,
    TResult? Function(int productId)? likeProduct,
    TResult? Function(int productId)? saveProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFeed() when loadFeed != null:
        return loadFeed();
      case _RefreshFeed() when refreshFeed != null:
        return refreshFeed();
      case _LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed();
      case _LikeProduct() when likeProduct != null:
        return likeProduct(_that.productId);
      case _SaveProduct() when saveProduct != null:
        return saveProduct(_that.productId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadFeed implements FeedEvent {
  const _LoadFeed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadFeed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedEvent.loadFeed()';
  }
}

/// @nodoc

class _RefreshFeed implements FeedEvent {
  const _RefreshFeed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RefreshFeed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedEvent.refreshFeed()';
  }
}

/// @nodoc

class _LoadMoreFeed implements FeedEvent {
  const _LoadMoreFeed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreFeed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedEvent.loadMoreFeed()';
  }
}

/// @nodoc

class _LikeProduct implements FeedEvent {
  const _LikeProduct(this.productId);

  final int productId;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LikeProductCopyWith<_LikeProduct> get copyWith =>
      __$LikeProductCopyWithImpl<_LikeProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeProduct &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'FeedEvent.likeProduct(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class _$LikeProductCopyWith<$Res>
    implements $FeedEventCopyWith<$Res> {
  factory _$LikeProductCopyWith(
          _LikeProduct value, $Res Function(_LikeProduct) _then) =
      __$LikeProductCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$LikeProductCopyWithImpl<$Res> implements _$LikeProductCopyWith<$Res> {
  __$LikeProductCopyWithImpl(this._self, this._then);

  final _LikeProduct _self;
  final $Res Function(_LikeProduct) _then;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(_LikeProduct(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SaveProduct implements FeedEvent {
  const _SaveProduct(this.productId);

  final int productId;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaveProductCopyWith<_SaveProduct> get copyWith =>
      __$SaveProductCopyWithImpl<_SaveProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveProduct &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'FeedEvent.saveProduct(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class _$SaveProductCopyWith<$Res>
    implements $FeedEventCopyWith<$Res> {
  factory _$SaveProductCopyWith(
          _SaveProduct value, $Res Function(_SaveProduct) _then) =
      __$SaveProductCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$SaveProductCopyWithImpl<$Res> implements _$SaveProductCopyWith<$Res> {
  __$SaveProductCopyWithImpl(this._self, this._then);

  final _SaveProduct _self;
  final $Res Function(_SaveProduct) _then;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(_SaveProduct(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
