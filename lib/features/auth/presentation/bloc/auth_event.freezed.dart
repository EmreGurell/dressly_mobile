// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_LoginWithGoogleRequested value)? loginWithGoogleRequested,
    TResult Function(_LoginWithAppleRequested value)? loginWithAppleRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_GetMeRequested value)? getMeRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_UpdateMeasurementsRequested value)?
        updateMeasurementsRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that);
      case _LoginWithGoogleRequested() when loginWithGoogleRequested != null:
        return loginWithGoogleRequested(_that);
      case _LoginWithAppleRequested() when loginWithAppleRequested != null:
        return loginWithAppleRequested(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
      case _GetMeRequested() when getMeRequested != null:
        return getMeRequested(_that);
      case _ForgotPasswordRequested() when forgotPasswordRequested != null:
        return forgotPasswordRequested(_that);
      case _UpdateMeasurementsRequested()
          when updateMeasurementsRequested != null:
        return updateMeasurementsRequested(_that);
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
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_LoginWithGoogleRequested value)
        loginWithGoogleRequested,
    required TResult Function(_LoginWithAppleRequested value)
        loginWithAppleRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_GetMeRequested value) getMeRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_UpdateMeasurementsRequested value)
        updateMeasurementsRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested():
        return loginRequested(_that);
      case _RegisterRequested():
        return registerRequested(_that);
      case _LoginWithGoogleRequested():
        return loginWithGoogleRequested(_that);
      case _LoginWithAppleRequested():
        return loginWithAppleRequested(_that);
      case _LogoutRequested():
        return logoutRequested(_that);
      case _GetMeRequested():
        return getMeRequested(_that);
      case _ForgotPasswordRequested():
        return forgotPasswordRequested(_that);
      case _UpdateMeasurementsRequested():
        return updateMeasurementsRequested(_that);
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
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_LoginWithGoogleRequested value)?
        loginWithGoogleRequested,
    TResult? Function(_LoginWithAppleRequested value)? loginWithAppleRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_GetMeRequested value)? getMeRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_UpdateMeasurementsRequested value)?
        updateMeasurementsRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that);
      case _LoginWithGoogleRequested() when loginWithGoogleRequested != null:
        return loginWithGoogleRequested(_that);
      case _LoginWithAppleRequested() when loginWithAppleRequested != null:
        return loginWithAppleRequested(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
      case _GetMeRequested() when getMeRequested != null:
        return getMeRequested(_that);
      case _ForgotPasswordRequested() when forgotPasswordRequested != null:
        return forgotPasswordRequested(_that);
      case _UpdateMeasurementsRequested()
          when updateMeasurementsRequested != null:
        return updateMeasurementsRequested(_that);
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
    TResult Function(String email, String password)? loginRequested,
    TResult Function(String email, String password, String name)?
        registerRequested,
    TResult Function()? loginWithGoogleRequested,
    TResult Function()? loginWithAppleRequested,
    TResult Function()? logoutRequested,
    TResult Function()? getMeRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function(String? gender, int? heightCm, int? weightKg, int? chestCm,
            int? waistCm, int? hipsCm)?
        updateMeasurementsRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that.email, _that.password);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that.email, _that.password, _that.name);
      case _LoginWithGoogleRequested() when loginWithGoogleRequested != null:
        return loginWithGoogleRequested();
      case _LoginWithAppleRequested() when loginWithAppleRequested != null:
        return loginWithAppleRequested();
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested();
      case _GetMeRequested() when getMeRequested != null:
        return getMeRequested();
      case _ForgotPasswordRequested() when forgotPasswordRequested != null:
        return forgotPasswordRequested(_that.email);
      case _UpdateMeasurementsRequested()
          when updateMeasurementsRequested != null:
        return updateMeasurementsRequested(_that.gender, _that.heightCm,
            _that.weightKg, _that.chestCm, _that.waistCm, _that.hipsCm);
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
    required TResult Function(String email, String password) loginRequested,
    required TResult Function(String email, String password, String name)
        registerRequested,
    required TResult Function() loginWithGoogleRequested,
    required TResult Function() loginWithAppleRequested,
    required TResult Function() logoutRequested,
    required TResult Function() getMeRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function(String? gender, int? heightCm, int? weightKg,
            int? chestCm, int? waistCm, int? hipsCm)
        updateMeasurementsRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested():
        return loginRequested(_that.email, _that.password);
      case _RegisterRequested():
        return registerRequested(_that.email, _that.password, _that.name);
      case _LoginWithGoogleRequested():
        return loginWithGoogleRequested();
      case _LoginWithAppleRequested():
        return loginWithAppleRequested();
      case _LogoutRequested():
        return logoutRequested();
      case _GetMeRequested():
        return getMeRequested();
      case _ForgotPasswordRequested():
        return forgotPasswordRequested(_that.email);
      case _UpdateMeasurementsRequested():
        return updateMeasurementsRequested(_that.gender, _that.heightCm,
            _that.weightKg, _that.chestCm, _that.waistCm, _that.hipsCm);
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
    TResult? Function(String email, String password)? loginRequested,
    TResult? Function(String email, String password, String name)?
        registerRequested,
    TResult? Function()? loginWithGoogleRequested,
    TResult? Function()? loginWithAppleRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? getMeRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function(String? gender, int? heightCm, int? weightKg,
            int? chestCm, int? waistCm, int? hipsCm)?
        updateMeasurementsRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that.email, _that.password);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that.email, _that.password, _that.name);
      case _LoginWithGoogleRequested() when loginWithGoogleRequested != null:
        return loginWithGoogleRequested();
      case _LoginWithAppleRequested() when loginWithAppleRequested != null:
        return loginWithAppleRequested();
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested();
      case _GetMeRequested() when getMeRequested != null:
        return getMeRequested();
      case _ForgotPasswordRequested() when forgotPasswordRequested != null:
        return forgotPasswordRequested(_that.email);
      case _UpdateMeasurementsRequested()
          when updateMeasurementsRequested != null:
        return updateMeasurementsRequested(_that.gender, _that.heightCm,
            _that.weightKg, _that.chestCm, _that.waistCm, _that.hipsCm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoginRequested implements AuthEvent {
  const _LoginRequested({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginRequestedCopyWith<_LoginRequested> get copyWith =>
      __$LoginRequestedCopyWithImpl<_LoginRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginRequested &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'AuthEvent.loginRequested(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$LoginRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$LoginRequestedCopyWith(
          _LoginRequested value, $Res Function(_LoginRequested) _then) =
      __$LoginRequestedCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginRequestedCopyWithImpl<$Res>
    implements _$LoginRequestedCopyWith<$Res> {
  __$LoginRequestedCopyWithImpl(this._self, this._then);

  final _LoginRequested _self;
  final $Res Function(_LoginRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_LoginRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _RegisterRequested implements AuthEvent {
  const _RegisterRequested(
      {required this.email, required this.password, required this.name});

  final String email;
  final String password;
  final String name;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterRequestedCopyWith<_RegisterRequested> get copyWith =>
      __$RegisterRequestedCopyWithImpl<_RegisterRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterRequested &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, name);

  @override
  String toString() {
    return 'AuthEvent.registerRequested(email: $email, password: $password, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$RegisterRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$RegisterRequestedCopyWith(
          _RegisterRequested value, $Res Function(_RegisterRequested) _then) =
      __$RegisterRequestedCopyWithImpl;
  @useResult
  $Res call({String email, String password, String name});
}

/// @nodoc
class __$RegisterRequestedCopyWithImpl<$Res>
    implements _$RegisterRequestedCopyWith<$Res> {
  __$RegisterRequestedCopyWithImpl(this._self, this._then);

  final _RegisterRequested _self;
  final $Res Function(_RegisterRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
  }) {
    return _then(_RegisterRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoginWithGoogleRequested implements AuthEvent {
  const _LoginWithGoogleRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginWithGoogleRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.loginWithGoogleRequested()';
  }
}

/// @nodoc

class _LoginWithAppleRequested implements AuthEvent {
  const _LoginWithAppleRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginWithAppleRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.loginWithAppleRequested()';
  }
}

/// @nodoc

class _LogoutRequested implements AuthEvent {
  const _LogoutRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }
}

/// @nodoc

class _GetMeRequested implements AuthEvent {
  const _GetMeRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetMeRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.getMeRequested()';
  }
}

/// @nodoc

class _ForgotPasswordRequested implements AuthEvent {
  const _ForgotPasswordRequested(this.email);

  final String email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPasswordRequestedCopyWith<_ForgotPasswordRequested> get copyWith =>
      __$ForgotPasswordRequestedCopyWithImpl<_ForgotPasswordRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPasswordRequested &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'AuthEvent.forgotPasswordRequested(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPasswordRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ForgotPasswordRequestedCopyWith(_ForgotPasswordRequested value,
          $Res Function(_ForgotPasswordRequested) _then) =
      __$ForgotPasswordRequestedCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$ForgotPasswordRequestedCopyWithImpl<$Res>
    implements _$ForgotPasswordRequestedCopyWith<$Res> {
  __$ForgotPasswordRequestedCopyWithImpl(this._self, this._then);

  final _ForgotPasswordRequested _self;
  final $Res Function(_ForgotPasswordRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_ForgotPasswordRequested(
      null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UpdateMeasurementsRequested implements AuthEvent {
  const _UpdateMeasurementsRequested(
      {this.gender,
      this.heightCm,
      this.weightKg,
      this.chestCm,
      this.waistCm,
      this.hipsCm});

  final String? gender;
  final int? heightCm;
  final int? weightKg;
  final int? chestCm;
  final int? waistCm;
  final int? hipsCm;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateMeasurementsRequestedCopyWith<_UpdateMeasurementsRequested>
      get copyWith => __$UpdateMeasurementsRequestedCopyWithImpl<
          _UpdateMeasurementsRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateMeasurementsRequested &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.chestCm, chestCm) || other.chestCm == chestCm) &&
            (identical(other.waistCm, waistCm) || other.waistCm == waistCm) &&
            (identical(other.hipsCm, hipsCm) || other.hipsCm == hipsCm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, gender, heightCm, weightKg, chestCm, waistCm, hipsCm);

  @override
  String toString() {
    return 'AuthEvent.updateMeasurementsRequested(gender: $gender, heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, hipsCm: $hipsCm)';
  }
}

/// @nodoc
abstract mixin class _$UpdateMeasurementsRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$UpdateMeasurementsRequestedCopyWith(
          _UpdateMeasurementsRequested value,
          $Res Function(_UpdateMeasurementsRequested) _then) =
      __$UpdateMeasurementsRequestedCopyWithImpl;
  @useResult
  $Res call(
      {String? gender,
      int? heightCm,
      int? weightKg,
      int? chestCm,
      int? waistCm,
      int? hipsCm});
}

/// @nodoc
class __$UpdateMeasurementsRequestedCopyWithImpl<$Res>
    implements _$UpdateMeasurementsRequestedCopyWith<$Res> {
  __$UpdateMeasurementsRequestedCopyWithImpl(this._self, this._then);

  final _UpdateMeasurementsRequested _self;
  final $Res Function(_UpdateMeasurementsRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gender = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? chestCm = freezed,
    Object? waistCm = freezed,
    Object? hipsCm = freezed,
  }) {
    return _then(_UpdateMeasurementsRequested(
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
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
