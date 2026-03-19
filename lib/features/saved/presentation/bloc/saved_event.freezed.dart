// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SavedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SavedEvent()';
  }
}

/// @nodoc
class $SavedEventCopyWith<$Res> {
  $SavedEventCopyWith(SavedEvent _, $Res Function(SavedEvent) __);
}

/// Adds pattern-matching-related methods to [SavedEvent].
extension SavedEventPatterns on SavedEvent {
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
    TResult Function(_FetchSaved value)? fetchSaved,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchSaved() when fetchSaved != null:
        return fetchSaved(_that);
      case _RemoveProduct() when removeProduct != null:
        return removeProduct(_that);
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
    required TResult Function(_FetchSaved value) fetchSaved,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchSaved():
        return fetchSaved(_that);
      case _RemoveProduct():
        return removeProduct(_that);
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
    TResult? Function(_FetchSaved value)? fetchSaved,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchSaved() when fetchSaved != null:
        return fetchSaved(_that);
      case _RemoveProduct() when removeProduct != null:
        return removeProduct(_that);
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
    TResult Function()? fetchSaved,
    TResult Function(int productId)? removeProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchSaved() when fetchSaved != null:
        return fetchSaved();
      case _RemoveProduct() when removeProduct != null:
        return removeProduct(_that.productId);
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
    required TResult Function() fetchSaved,
    required TResult Function(int productId) removeProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchSaved():
        return fetchSaved();
      case _RemoveProduct():
        return removeProduct(_that.productId);
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
    TResult? Function()? fetchSaved,
    TResult? Function(int productId)? removeProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchSaved() when fetchSaved != null:
        return fetchSaved();
      case _RemoveProduct() when removeProduct != null:
        return removeProduct(_that.productId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FetchSaved implements SavedEvent {
  const _FetchSaved();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SavedEvent.fetchSaved()';
  }
}

/// @nodoc

class _RemoveProduct implements SavedEvent {
  const _RemoveProduct(this.productId);

  final int productId;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoveProductCopyWith<_RemoveProduct> get copyWith =>
      __$RemoveProductCopyWithImpl<_RemoveProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoveProduct &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'SavedEvent.removeProduct(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class _$RemoveProductCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory _$RemoveProductCopyWith(
          _RemoveProduct value, $Res Function(_RemoveProduct) _then) =
      __$RemoveProductCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$RemoveProductCopyWithImpl<$Res>
    implements _$RemoveProductCopyWith<$Res> {
  __$RemoveProductCopyWithImpl(this._self, this._then);

  final _RemoveProduct _self;
  final $Res Function(_RemoveProduct) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(_RemoveProduct(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
