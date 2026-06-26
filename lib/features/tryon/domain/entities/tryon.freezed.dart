// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tryon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TryonResult {
  int get id;
  int get productId;
  String get productName;
  String get productImageUrl;
  String get userPhotoUrl;
  String get status;
  String? get resultImageUrl;
  String? get errorMessage;
  String get createdAt;

  /// Create a copy of TryonResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TryonResultCopyWith<TryonResult> get copyWith =>
      _$TryonResultCopyWithImpl<TryonResult>(this as TryonResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TryonResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                other.userPhotoUrl == userPhotoUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.resultImageUrl, resultImageUrl) ||
                other.resultImageUrl == resultImageUrl) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      productName,
      productImageUrl,
      userPhotoUrl,
      status,
      resultImageUrl,
      errorMessage,
      createdAt);

  @override
  String toString() {
    return 'TryonResult(id: $id, productId: $productId, productName: $productName, productImageUrl: $productImageUrl, userPhotoUrl: $userPhotoUrl, status: $status, resultImageUrl: $resultImageUrl, errorMessage: $errorMessage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $TryonResultCopyWith<$Res> {
  factory $TryonResultCopyWith(
          TryonResult value, $Res Function(TryonResult) _then) =
      _$TryonResultCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int productId,
      String productName,
      String productImageUrl,
      String userPhotoUrl,
      String status,
      String? resultImageUrl,
      String? errorMessage,
      String createdAt});
}

/// @nodoc
class _$TryonResultCopyWithImpl<$Res> implements $TryonResultCopyWith<$Res> {
  _$TryonResultCopyWithImpl(this._self, this._then);

  final TryonResult _self;
  final $Res Function(TryonResult) _then;

  /// Create a copy of TryonResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImageUrl = null,
    Object? userPhotoUrl = null,
    Object? status = null,
    Object? resultImageUrl = freezed,
    Object? errorMessage = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: null == productImageUrl
          ? _self.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: null == userPhotoUrl
          ? _self.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      resultImageUrl: freezed == resultImageUrl
          ? _self.resultImageUrl
          : resultImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TryonResult].
extension TryonResultPatterns on TryonResult {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TryonResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TryonResult() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_TryonResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResult():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TryonResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResult() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            int productId,
            String productName,
            String productImageUrl,
            String userPhotoUrl,
            String status,
            String? resultImageUrl,
            String? errorMessage,
            String createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TryonResult() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productImageUrl,
            _that.userPhotoUrl,
            _that.status,
            _that.resultImageUrl,
            _that.errorMessage,
            _that.createdAt);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            int productId,
            String productName,
            String productImageUrl,
            String userPhotoUrl,
            String status,
            String? resultImageUrl,
            String? errorMessage,
            String createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResult():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productImageUrl,
            _that.userPhotoUrl,
            _that.status,
            _that.resultImageUrl,
            _that.errorMessage,
            _that.createdAt);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            int productId,
            String productName,
            String productImageUrl,
            String userPhotoUrl,
            String status,
            String? resultImageUrl,
            String? errorMessage,
            String createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResult() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productImageUrl,
            _that.userPhotoUrl,
            _that.status,
            _that.resultImageUrl,
            _that.errorMessage,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TryonResult implements TryonResult {
  const _TryonResult(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.productImageUrl,
      required this.userPhotoUrl,
      required this.status,
      this.resultImageUrl,
      this.errorMessage,
      required this.createdAt});

  @override
  final int id;
  @override
  final int productId;
  @override
  final String productName;
  @override
  final String productImageUrl;
  @override
  final String userPhotoUrl;
  @override
  final String status;
  @override
  final String? resultImageUrl;
  @override
  final String? errorMessage;
  @override
  final String createdAt;

  /// Create a copy of TryonResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TryonResultCopyWith<_TryonResult> get copyWith =>
      __$TryonResultCopyWithImpl<_TryonResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TryonResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                other.userPhotoUrl == userPhotoUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.resultImageUrl, resultImageUrl) ||
                other.resultImageUrl == resultImageUrl) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      productName,
      productImageUrl,
      userPhotoUrl,
      status,
      resultImageUrl,
      errorMessage,
      createdAt);

  @override
  String toString() {
    return 'TryonResult(id: $id, productId: $productId, productName: $productName, productImageUrl: $productImageUrl, userPhotoUrl: $userPhotoUrl, status: $status, resultImageUrl: $resultImageUrl, errorMessage: $errorMessage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$TryonResultCopyWith<$Res>
    implements $TryonResultCopyWith<$Res> {
  factory _$TryonResultCopyWith(
          _TryonResult value, $Res Function(_TryonResult) _then) =
      __$TryonResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int productId,
      String productName,
      String productImageUrl,
      String userPhotoUrl,
      String status,
      String? resultImageUrl,
      String? errorMessage,
      String createdAt});
}

/// @nodoc
class __$TryonResultCopyWithImpl<$Res> implements _$TryonResultCopyWith<$Res> {
  __$TryonResultCopyWithImpl(this._self, this._then);

  final _TryonResult _self;
  final $Res Function(_TryonResult) _then;

  /// Create a copy of TryonResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImageUrl = null,
    Object? userPhotoUrl = null,
    Object? status = null,
    Object? resultImageUrl = freezed,
    Object? errorMessage = freezed,
    Object? createdAt = null,
  }) {
    return _then(_TryonResult(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: null == productImageUrl
          ? _self.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: null == userPhotoUrl
          ? _self.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      resultImageUrl: freezed == resultImageUrl
          ? _self.resultImageUrl
          : resultImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
