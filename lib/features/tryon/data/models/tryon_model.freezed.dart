// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tryon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TryonResultModel {
  int get id;
  @JsonKey(name: 'product_id')
  int get productId;
  @JsonKey(name: 'product_name')
  String get productName;
  @JsonKey(name: 'product_image_url')
  String get productImageUrl;
  @JsonKey(name: 'user_photo_url')
  String get userPhotoUrl;
  String get status;
  @JsonKey(name: 'result_image_url')
  String? get resultImageUrl;
  @JsonKey(name: 'error_message')
  String? get errorMessage;
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of TryonResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TryonResultModelCopyWith<TryonResultModel> get copyWith =>
      _$TryonResultModelCopyWithImpl<TryonResultModel>(
          this as TryonResultModel, _$identity);

  /// Serializes this TryonResultModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TryonResultModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'TryonResultModel(id: $id, productId: $productId, productName: $productName, productImageUrl: $productImageUrl, userPhotoUrl: $userPhotoUrl, status: $status, resultImageUrl: $resultImageUrl, errorMessage: $errorMessage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $TryonResultModelCopyWith<$Res> {
  factory $TryonResultModelCopyWith(
          TryonResultModel value, $Res Function(TryonResultModel) _then) =
      _$TryonResultModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_image_url') String productImageUrl,
      @JsonKey(name: 'user_photo_url') String userPhotoUrl,
      String status,
      @JsonKey(name: 'result_image_url') String? resultImageUrl,
      @JsonKey(name: 'error_message') String? errorMessage,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$TryonResultModelCopyWithImpl<$Res>
    implements $TryonResultModelCopyWith<$Res> {
  _$TryonResultModelCopyWithImpl(this._self, this._then);

  final TryonResultModel _self;
  final $Res Function(TryonResultModel) _then;

  /// Create a copy of TryonResultModel
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

/// Adds pattern-matching-related methods to [TryonResultModel].
extension TryonResultModelPatterns on TryonResultModel {
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
    TResult Function(_TryonResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TryonResultModel() when $default != null:
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
    TResult Function(_TryonResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResultModel():
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
    TResult? Function(_TryonResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResultModel() when $default != null:
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
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'product_image_url') String productImageUrl,
            @JsonKey(name: 'user_photo_url') String userPhotoUrl,
            String status,
            @JsonKey(name: 'result_image_url') String? resultImageUrl,
            @JsonKey(name: 'error_message') String? errorMessage,
            @JsonKey(name: 'created_at') String createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TryonResultModel() when $default != null:
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
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'product_image_url') String productImageUrl,
            @JsonKey(name: 'user_photo_url') String userPhotoUrl,
            String status,
            @JsonKey(name: 'result_image_url') String? resultImageUrl,
            @JsonKey(name: 'error_message') String? errorMessage,
            @JsonKey(name: 'created_at') String createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResultModel():
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
            @JsonKey(name: 'product_id') int productId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'product_image_url') String productImageUrl,
            @JsonKey(name: 'user_photo_url') String userPhotoUrl,
            String status,
            @JsonKey(name: 'result_image_url') String? resultImageUrl,
            @JsonKey(name: 'error_message') String? errorMessage,
            @JsonKey(name: 'created_at') String createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TryonResultModel() when $default != null:
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
@JsonSerializable()
class _TryonResultModel implements TryonResultModel {
  const _TryonResultModel(
      {required this.id,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_image_url') required this.productImageUrl,
      @JsonKey(name: 'user_photo_url') required this.userPhotoUrl,
      required this.status,
      @JsonKey(name: 'result_image_url') this.resultImageUrl,
      @JsonKey(name: 'error_message') this.errorMessage,
      @JsonKey(name: 'created_at') required this.createdAt});
  factory _TryonResultModel.fromJson(Map<String, dynamic> json) =>
      _$TryonResultModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_image_url')
  final String productImageUrl;
  @override
  @JsonKey(name: 'user_photo_url')
  final String userPhotoUrl;
  @override
  final String status;
  @override
  @JsonKey(name: 'result_image_url')
  final String? resultImageUrl;
  @override
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// Create a copy of TryonResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TryonResultModelCopyWith<_TryonResultModel> get copyWith =>
      __$TryonResultModelCopyWithImpl<_TryonResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TryonResultModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TryonResultModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'TryonResultModel(id: $id, productId: $productId, productName: $productName, productImageUrl: $productImageUrl, userPhotoUrl: $userPhotoUrl, status: $status, resultImageUrl: $resultImageUrl, errorMessage: $errorMessage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$TryonResultModelCopyWith<$Res>
    implements $TryonResultModelCopyWith<$Res> {
  factory _$TryonResultModelCopyWith(
          _TryonResultModel value, $Res Function(_TryonResultModel) _then) =
      __$TryonResultModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_image_url') String productImageUrl,
      @JsonKey(name: 'user_photo_url') String userPhotoUrl,
      String status,
      @JsonKey(name: 'result_image_url') String? resultImageUrl,
      @JsonKey(name: 'error_message') String? errorMessage,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$TryonResultModelCopyWithImpl<$Res>
    implements _$TryonResultModelCopyWith<$Res> {
  __$TryonResultModelCopyWithImpl(this._self, this._then);

  final _TryonResultModel _self;
  final $Res Function(_TryonResultModel) _then;

  /// Create a copy of TryonResultModel
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
    return _then(_TryonResultModel(
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
