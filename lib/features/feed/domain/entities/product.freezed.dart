// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {
  int get id;
  String get brandName;
  String get name;
  double get price;
  String get imageUrl;
  String get category;
  String get brandLogoUrl;
  int get likeCount;
  int get saveCount;
  bool get isLiked;
  bool get isSaved;
  String get productUrl;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.name, name) || other.name == name) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      brandName,
      name,
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
    return 'Product(id: $id, brandName: $brandName, name: $name, price: $price, imageUrl: $imageUrl, category: $category, brandLogoUrl: $brandLogoUrl, likeCount: $likeCount, saveCount: $saveCount, isLiked: $isLiked, isSaved: $isSaved, productUrl: $productUrl)';
  }
}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) =
      _$ProductCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String brandName,
      String name,
      double price,
      String imageUrl,
      String category,
      String brandLogoUrl,
      int likeCount,
      int saveCount,
      bool isLiked,
      bool isSaved,
      String productUrl});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandName = null,
    Object? name = null,
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
      brandName: null == brandName
          ? _self.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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
    TResult Function(_Product value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
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
    TResult Function(_Product value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product():
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
    TResult? Function(_Product value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
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
            String brandName,
            String name,
            double price,
            String imageUrl,
            String category,
            String brandLogoUrl,
            int likeCount,
            int saveCount,
            bool isLiked,
            bool isSaved,
            String productUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
        return $default(
            _that.id,
            _that.brandName,
            _that.name,
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
            String brandName,
            String name,
            double price,
            String imageUrl,
            String category,
            String brandLogoUrl,
            int likeCount,
            int saveCount,
            bool isLiked,
            bool isSaved,
            String productUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product():
        return $default(
            _that.id,
            _that.brandName,
            _that.name,
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
            String brandName,
            String name,
            double price,
            String imageUrl,
            String category,
            String brandLogoUrl,
            int likeCount,
            int saveCount,
            bool isLiked,
            bool isSaved,
            String productUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
        return $default(
            _that.id,
            _that.brandName,
            _that.name,
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

class _Product implements Product {
  const _Product(
      {required this.id,
      required this.brandName,
      required this.name,
      required this.price,
      required this.imageUrl,
      required this.category,
      this.brandLogoUrl = '',
      this.likeCount = 0,
      this.saveCount = 0,
      this.isLiked = false,
      this.isSaved = false,
      this.productUrl = ''});

  @override
  final int id;
  @override
  final String brandName;
  @override
  final String name;
  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final String category;
  @override
  @JsonKey()
  final String brandLogoUrl;
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final int saveCount;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  @JsonKey()
  final String productUrl;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.name, name) || other.name == name) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      brandName,
      name,
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
    return 'Product(id: $id, brandName: $brandName, name: $name, price: $price, imageUrl: $imageUrl, category: $category, brandLogoUrl: $brandLogoUrl, likeCount: $likeCount, saveCount: $saveCount, isLiked: $isLiked, isSaved: $isSaved, productUrl: $productUrl)';
  }
}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) =
      __$ProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String brandName,
      String name,
      double price,
      String imageUrl,
      String category,
      String brandLogoUrl,
      int likeCount,
      int saveCount,
      bool isLiked,
      bool isSaved,
      String productUrl});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? brandName = null,
    Object? name = null,
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
    return _then(_Product(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: null == brandName
          ? _self.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
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
