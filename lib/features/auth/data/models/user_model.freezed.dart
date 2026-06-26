// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  int get id;
  String get email;
  @JsonKey(name: 'display_name')
  String? get name;
  @JsonKey(name: 'photo_url')
  String? get avatar;
  String? get gender;
  @JsonKey(name: 'is_onboarded')
  bool get isOnboarded;
  @JsonKey(name: 'height_cm')
  int? get heightCm;
  @JsonKey(name: 'weight_kg')
  int? get weightKg;
  @JsonKey(name: 'chest_cm')
  int? get chestCm;
  @JsonKey(name: 'waist_cm')
  int? get waistCm;
  @JsonKey(name: 'hips_cm')
  int? get hipsCm;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isOnboarded, isOnboarded) ||
                other.isOnboarded == isOnboarded) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.chestCm, chestCm) || other.chestCm == chestCm) &&
            (identical(other.waistCm, waistCm) || other.waistCm == waistCm) &&
            (identical(other.hipsCm, hipsCm) || other.hipsCm == hipsCm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, avatar, gender,
      isOnboarded, heightCm, weightKg, chestCm, waistCm, hipsCm);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, avatar: $avatar, gender: $gender, isOnboarded: $isOnboarded, heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, hipsCm: $hipsCm)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String email,
      @JsonKey(name: 'display_name') String? name,
      @JsonKey(name: 'photo_url') String? avatar,
      String? gender,
      @JsonKey(name: 'is_onboarded') bool isOnboarded,
      @JsonKey(name: 'height_cm') int? heightCm,
      @JsonKey(name: 'weight_kg') int? weightKg,
      @JsonKey(name: 'chest_cm') int? chestCm,
      @JsonKey(name: 'waist_cm') int? waistCm,
      @JsonKey(name: 'hips_cm') int? hipsCm});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? gender = freezed,
    Object? isOnboarded = null,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? chestCm = freezed,
    Object? waistCm = freezed,
    Object? hipsCm = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnboarded: null == isOnboarded
          ? _self.isOnboarded
          : isOnboarded // ignore: cast_nullable_to_non_nullable
              as bool,
      heightCm: freezed == heightCm
          ? _self.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as int?,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as int?,
      chestCm: freezed == chestCm
          ? _self.chestCm
          : chestCm // ignore: cast_nullable_to_non_nullable
              as int?,
      waistCm: freezed == waistCm
          ? _self.waistCm
          : waistCm // ignore: cast_nullable_to_non_nullable
              as int?,
      hipsCm: freezed == hipsCm
          ? _self.hipsCm
          : hipsCm // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(_UserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
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
    TResult? Function(_UserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
            String email,
            @JsonKey(name: 'display_name') String? name,
            @JsonKey(name: 'photo_url') String? avatar,
            String? gender,
            @JsonKey(name: 'is_onboarded') bool isOnboarded,
            @JsonKey(name: 'height_cm') int? heightCm,
            @JsonKey(name: 'weight_kg') int? weightKg,
            @JsonKey(name: 'chest_cm') int? chestCm,
            @JsonKey(name: 'waist_cm') int? waistCm,
            @JsonKey(name: 'hips_cm') int? hipsCm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.name,
            _that.avatar,
            _that.gender,
            _that.isOnboarded,
            _that.heightCm,
            _that.weightKg,
            _that.chestCm,
            _that.waistCm,
            _that.hipsCm);
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
            String email,
            @JsonKey(name: 'display_name') String? name,
            @JsonKey(name: 'photo_url') String? avatar,
            String? gender,
            @JsonKey(name: 'is_onboarded') bool isOnboarded,
            @JsonKey(name: 'height_cm') int? heightCm,
            @JsonKey(name: 'weight_kg') int? weightKg,
            @JsonKey(name: 'chest_cm') int? chestCm,
            @JsonKey(name: 'waist_cm') int? waistCm,
            @JsonKey(name: 'hips_cm') int? hipsCm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(
            _that.id,
            _that.email,
            _that.name,
            _that.avatar,
            _that.gender,
            _that.isOnboarded,
            _that.heightCm,
            _that.weightKg,
            _that.chestCm,
            _that.waistCm,
            _that.hipsCm);
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
            String email,
            @JsonKey(name: 'display_name') String? name,
            @JsonKey(name: 'photo_url') String? avatar,
            String? gender,
            @JsonKey(name: 'is_onboarded') bool isOnboarded,
            @JsonKey(name: 'height_cm') int? heightCm,
            @JsonKey(name: 'weight_kg') int? weightKg,
            @JsonKey(name: 'chest_cm') int? chestCm,
            @JsonKey(name: 'waist_cm') int? waistCm,
            @JsonKey(name: 'hips_cm') int? hipsCm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.name,
            _that.avatar,
            _that.gender,
            _that.isOnboarded,
            _that.heightCm,
            _that.weightKg,
            _that.chestCm,
            _that.waistCm,
            _that.hipsCm);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {required this.id,
      required this.email,
      @JsonKey(name: 'display_name') this.name,
      @JsonKey(name: 'photo_url') this.avatar,
      this.gender,
      @JsonKey(name: 'is_onboarded') this.isOnboarded = false,
      @JsonKey(name: 'height_cm') this.heightCm,
      @JsonKey(name: 'weight_kg') this.weightKg,
      @JsonKey(name: 'chest_cm') this.chestCm,
      @JsonKey(name: 'waist_cm') this.waistCm,
      @JsonKey(name: 'hips_cm') this.hipsCm});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  @JsonKey(name: 'display_name')
  final String? name;
  @override
  @JsonKey(name: 'photo_url')
  final String? avatar;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'is_onboarded')
  final bool isOnboarded;
  @override
  @JsonKey(name: 'height_cm')
  final int? heightCm;
  @override
  @JsonKey(name: 'weight_kg')
  final int? weightKg;
  @override
  @JsonKey(name: 'chest_cm')
  final int? chestCm;
  @override
  @JsonKey(name: 'waist_cm')
  final int? waistCm;
  @override
  @JsonKey(name: 'hips_cm')
  final int? hipsCm;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isOnboarded, isOnboarded) ||
                other.isOnboarded == isOnboarded) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.chestCm, chestCm) || other.chestCm == chestCm) &&
            (identical(other.waistCm, waistCm) || other.waistCm == waistCm) &&
            (identical(other.hipsCm, hipsCm) || other.hipsCm == hipsCm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, avatar, gender,
      isOnboarded, heightCm, weightKg, chestCm, waistCm, hipsCm);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, avatar: $avatar, gender: $gender, isOnboarded: $isOnboarded, heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, hipsCm: $hipsCm)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      @JsonKey(name: 'display_name') String? name,
      @JsonKey(name: 'photo_url') String? avatar,
      String? gender,
      @JsonKey(name: 'is_onboarded') bool isOnboarded,
      @JsonKey(name: 'height_cm') int? heightCm,
      @JsonKey(name: 'weight_kg') int? weightKg,
      @JsonKey(name: 'chest_cm') int? chestCm,
      @JsonKey(name: 'waist_cm') int? waistCm,
      @JsonKey(name: 'hips_cm') int? hipsCm});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? gender = freezed,
    Object? isOnboarded = null,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? chestCm = freezed,
    Object? waistCm = freezed,
    Object? hipsCm = freezed,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnboarded: null == isOnboarded
          ? _self.isOnboarded
          : isOnboarded // ignore: cast_nullable_to_non_nullable
              as bool,
      heightCm: freezed == heightCm
          ? _self.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as int?,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as int?,
      chestCm: freezed == chestCm
          ? _self.chestCm
          : chestCm // ignore: cast_nullable_to_non_nullable
              as int?,
      waistCm: freezed == waistCm
          ? _self.waistCm
          : waistCm // ignore: cast_nullable_to_non_nullable
              as int?,
      hipsCm: freezed == hipsCm
          ? _self.hipsCm
          : hipsCm // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
