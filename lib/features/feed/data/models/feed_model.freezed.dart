// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {
  int get id;
  String get name;
  @JsonKey(name: 'brand_name')
  String get brandName;
  @JsonKey(fromJson: _parseDouble)
  double get price; // ignore: invalid_annotation_target
  @JsonKey(name: 'image_url')
  String get imageUrl;
  String get category;
  @JsonKey(name: 'brand_logo_url')
  String get brandLogoUrl;
  @JsonKey(name: 'like_count')
  int get likeCount;
  @JsonKey(name: 'save_count')
  int get saveCount; // ignore: invalid_annotation_target
  @JsonKey(name: 'is_liked')
  bool get isLiked; // ignore: invalid_annotation_target
  @JsonKey(name: 'is_saved')
  bool get isSaved;
  @JsonKey(name: 'product_url')
  String get productUrl;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<ProductModel> get copyWith =>
      _$ProductModelCopyWithImpl<ProductModel>(
          this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brandLogoUrl, brandLogoUrl) ||
                other.brandLogoUrl == brandLogoUrl) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.saveCount, saveCount) ||
                other.saveCount == saveCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      brandName,
      price,
      imageUrl,
      category,
      brandLogoUrl,
      likeCount,
      saveCount,
      isLiked,
      isSaved,
      productUrl);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, brandName: $brandName, price: $price, imageUrl: $imageUrl, category: $category, brandLogoUrl: $brandLogoUrl, likeCount: $likeCount, saveCount: $saveCount, isLiked: $isLiked, isSaved: $isSaved, productUrl: $productUrl)';
  }
}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) _then) =
      _$ProductModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'brand_name') String brandName,
      @JsonKey(fromJson: _parseDouble) double price,
      @JsonKey(name: 'image_url') String imageUrl,
      String category,
      @JsonKey(name: 'brand_logo_url') String brandLogoUrl,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'save_count') int saveCount,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'is_saved') bool isSaved,
      @JsonKey(name: 'product_url') String productUrl});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brandName = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? category = null,
    Object? brandLogoUrl = null,
    Object? likeCount = null,
    Object? saveCount = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? productUrl = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _self.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brandLogoUrl: null == brandLogoUrl
          ? _self.brandLogoUrl
          : brandLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _self.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      saveCount: null == saveCount
          ? _self.saveCount
          : saveCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      productUrl: null == productUrl
          ? _self.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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
    TResult Function(_ProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
    TResult Function(_ProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
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
    TResult? Function(_ProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
            String name,
            @JsonKey(name: 'brand_name') String brandName,
            @JsonKey(fromJson: _parseDouble) double price,
            @JsonKey(name: 'image_url') String imageUrl,
            String category,
            @JsonKey(name: 'brand_logo_url') String brandLogoUrl,
            @JsonKey(name: 'like_count') int likeCount,
            @JsonKey(name: 'save_count') int saveCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'is_saved') bool isSaved,
            @JsonKey(name: 'product_url') String productUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.brandName,
            _that.price,
            _that.imageUrl,
            _that.category,
            _that.brandLogoUrl,
            _that.likeCount,
            _that.saveCount,
            _that.isLiked,
            _that.isSaved,
            _that.productUrl);
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
            String name,
            @JsonKey(name: 'brand_name') String brandName,
            @JsonKey(fromJson: _parseDouble) double price,
            @JsonKey(name: 'image_url') String imageUrl,
            String category,
            @JsonKey(name: 'brand_logo_url') String brandLogoUrl,
            @JsonKey(name: 'like_count') int likeCount,
            @JsonKey(name: 'save_count') int saveCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'is_saved') bool isSaved,
            @JsonKey(name: 'product_url') String productUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
        return $default(
            _that.id,
            _that.name,
            _that.brandName,
            _that.price,
            _that.imageUrl,
            _that.category,
            _that.brandLogoUrl,
            _that.likeCount,
            _that.saveCount,
            _that.isLiked,
            _that.isSaved,
            _that.productUrl);
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
            String name,
            @JsonKey(name: 'brand_name') String brandName,
            @JsonKey(fromJson: _parseDouble) double price,
            @JsonKey(name: 'image_url') String imageUrl,
            String category,
            @JsonKey(name: 'brand_logo_url') String brandLogoUrl,
            @JsonKey(name: 'like_count') int likeCount,
            @JsonKey(name: 'save_count') int saveCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'is_saved') bool isSaved,
            @JsonKey(name: 'product_url') String productUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.brandName,
            _that.price,
            _that.imageUrl,
            _that.category,
            _that.brandLogoUrl,
            _that.likeCount,
            _that.saveCount,
            _that.isLiked,
            _that.isSaved,
            _that.productUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductModel implements ProductModel {
  const _ProductModel(
      {required this.id,
      required this.name,
      @JsonKey(name: 'brand_name') required this.brandName,
      @JsonKey(fromJson: _parseDouble) required this.price,
      @JsonKey(name: 'image_url') required this.imageUrl,
      required this.category,
      @JsonKey(name: 'brand_logo_url') this.brandLogoUrl = '',
      @JsonKey(name: 'like_count') this.likeCount = 0,
      @JsonKey(name: 'save_count') this.saveCount = 0,
      @JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'is_saved') this.isSaved = false,
      @JsonKey(name: 'product_url') this.productUrl = ''});
  factory _ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'brand_name')
  final String brandName;
  @override
  @JsonKey(fromJson: _parseDouble)
  final double price;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  final String category;
  @override
  @JsonKey(name: 'brand_logo_url')
  final String brandLogoUrl;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @JsonKey(name: 'save_count')
  final int saveCount;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'is_saved')
  final bool isSaved;
  @override
  @JsonKey(name: 'product_url')
  final String productUrl;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brandLogoUrl, brandLogoUrl) ||
                other.brandLogoUrl == brandLogoUrl) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.saveCount, saveCount) ||
                other.saveCount == saveCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      brandName,
      price,
      imageUrl,
      category,
      brandLogoUrl,
      likeCount,
      saveCount,
      isLiked,
      isSaved,
      productUrl);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, brandName: $brandName, price: $price, imageUrl: $imageUrl, category: $category, brandLogoUrl: $brandLogoUrl, likeCount: $likeCount, saveCount: $saveCount, isLiked: $isLiked, isSaved: $isSaved, productUrl: $productUrl)';
  }
}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) _then) =
      __$ProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'brand_name') String brandName,
      @JsonKey(fromJson: _parseDouble) double price,
      @JsonKey(name: 'image_url') String imageUrl,
      String category,
      @JsonKey(name: 'brand_logo_url') String brandLogoUrl,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'save_count') int saveCount,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'is_saved') bool isSaved,
      @JsonKey(name: 'product_url') String productUrl});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brandName = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? category = null,
    Object? brandLogoUrl = null,
    Object? likeCount = null,
    Object? saveCount = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? productUrl = null,
  }) {
    return _then(_ProductModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _self.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brandLogoUrl: null == brandLogoUrl
          ? _self.brandLogoUrl
          : brandLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _self.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      saveCount: null == saveCount
          ? _self.saveCount
          : saveCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      productUrl: null == productUrl
          ? _self.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
