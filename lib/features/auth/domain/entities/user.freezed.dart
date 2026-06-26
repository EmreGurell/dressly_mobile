// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  String get id;
  String get email;
  String? get name;
  String? get avatar;
  String? get gender;
  bool get isOnboarded;
  int? get heightCm;
  int? get weightKg;
  int? get chestCm;
  int? get waistCm;
  int? get hipsCm;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, avatar, gender,
      isOnboarded, heightCm, weightKg, chestCm, waistCm, hipsCm);

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, avatar: $avatar, gender: $gender, isOnboarded: $isOnboarded, heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, hipsCm: $hipsCm)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      String? avatar,
      String? gender,
      bool isOnboarded,
      int? heightCm,
      int? weightKg,
      int? chestCm,
      int? waistCm,
      int? hipsCm});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
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
              as String,
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

/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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
    TResult Function(_User value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
    TResult Function(_User value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
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
    TResult? Function(_User value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
            String id,
            String email,
            String? name,
            String? avatar,
            String? gender,
            bool isOnboarded,
            int? heightCm,
            int? weightKg,
            int? chestCm,
            int? waistCm,
            int? hipsCm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
            String id,
            String email,
            String? name,
            String? avatar,
            String? gender,
            bool isOnboarded,
            int? heightCm,
            int? weightKg,
            int? chestCm,
            int? waistCm,
            int? hipsCm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
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
            String id,
            String email,
            String? name,
            String? avatar,
            String? gender,
            bool isOnboarded,
            int? heightCm,
            int? weightKg,
            int? chestCm,
            int? waistCm,
            int? hipsCm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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

class _User implements User {
  const _User(
      {required this.id,
      required this.email,
      this.name,
      this.avatar,
      this.gender,
      this.isOnboarded = false,
      this.heightCm,
      this.weightKg,
      this.chestCm,
      this.waistCm,
      this.hipsCm});

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? gender;
  @override
  @JsonKey()
  final bool isOnboarded;
  @override
  final int? heightCm;
  @override
  final int? weightKg;
  @override
  final int? chestCm;
  @override
  final int? waistCm;
  @override
  final int? hipsCm;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, avatar, gender,
      isOnboarded, heightCm, weightKg, chestCm, waistCm, hipsCm);

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, avatar: $avatar, gender: $gender, isOnboarded: $isOnboarded, heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, hipsCm: $hipsCm)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      String? avatar,
      String? gender,
      bool isOnboarded,
      int? heightCm,
      int? weightKg,
      int? chestCm,
      int? waistCm,
      int? hipsCm});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
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
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
