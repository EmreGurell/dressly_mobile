// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tryon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TryonState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TryonState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TryonState()';
  }
}

/// @nodoc
class $TryonStateCopyWith<$Res> {
  $TryonStateCopyWith(TryonState _, $Res Function(TryonState) __);
}

/// Adds pattern-matching-related methods to [TryonState].
extension TryonStatePatterns on TryonState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_PhotoSelected value)? photoSelected,
    TResult Function(_Loading value)? loading,
    TResult Function(_Polling value)? polling,
    TResult Function(_Success value)? success,
    TResult Function(_ResultSaved value)? resultSaved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Polling() when polling != null:
        return polling(_that);
      case _Success() when success != null:
        return success(_that);
      case _ResultSaved() when resultSaved != null:
        return resultSaved(_that);
      case _Error() when error != null:
        return error(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_PhotoSelected value) photoSelected,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Polling value) polling,
    required TResult Function(_Success value) success,
    required TResult Function(_ResultSaved value) resultSaved,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _PhotoSelected():
        return photoSelected(_that);
      case _Loading():
        return loading(_that);
      case _Polling():
        return polling(_that);
      case _Success():
        return success(_that);
      case _ResultSaved():
        return resultSaved(_that);
      case _Error():
        return error(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PhotoSelected value)? photoSelected,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Polling value)? polling,
    TResult? Function(_Success value)? success,
    TResult? Function(_ResultSaved value)? resultSaved,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Polling() when polling != null:
        return polling(_that);
      case _Success() when success != null:
        return success(_that);
      case _ResultSaved() when resultSaved != null:
        return resultSaved(_that);
      case _Error() when error != null:
        return error(_that);
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
    TResult Function()? initial,
    TResult Function(XFile photo)? photoSelected,
    TResult Function(XFile photo)? loading,
    TResult Function(XFile photo, TryonResult result)? polling,
    TResult Function(TryonResult result)? success,
    TResult Function()? resultSaved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that.photo);
      case _Loading() when loading != null:
        return loading(_that.photo);
      case _Polling() when polling != null:
        return polling(_that.photo, _that.result);
      case _Success() when success != null:
        return success(_that.result);
      case _ResultSaved() when resultSaved != null:
        return resultSaved();
      case _Error() when error != null:
        return error(_that.message);
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
    required TResult Function() initial,
    required TResult Function(XFile photo) photoSelected,
    required TResult Function(XFile photo) loading,
    required TResult Function(XFile photo, TryonResult result) polling,
    required TResult Function(TryonResult result) success,
    required TResult Function() resultSaved,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _PhotoSelected():
        return photoSelected(_that.photo);
      case _Loading():
        return loading(_that.photo);
      case _Polling():
        return polling(_that.photo, _that.result);
      case _Success():
        return success(_that.result);
      case _ResultSaved():
        return resultSaved();
      case _Error():
        return error(_that.message);
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
    TResult? Function()? initial,
    TResult? Function(XFile photo)? photoSelected,
    TResult? Function(XFile photo)? loading,
    TResult? Function(XFile photo, TryonResult result)? polling,
    TResult? Function(TryonResult result)? success,
    TResult? Function()? resultSaved,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that.photo);
      case _Loading() when loading != null:
        return loading(_that.photo);
      case _Polling() when polling != null:
        return polling(_that.photo, _that.result);
      case _Success() when success != null:
        return success(_that.result);
      case _ResultSaved() when resultSaved != null:
        return resultSaved();
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TryonState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TryonState.initial()';
  }
}

/// @nodoc

class _PhotoSelected implements TryonState {
  const _PhotoSelected(this.photo);

  final XFile photo;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PhotoSelectedCopyWith<_PhotoSelected> get copyWith =>
      __$PhotoSelectedCopyWithImpl<_PhotoSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoSelected &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @override
  String toString() {
    return 'TryonState.photoSelected(photo: $photo)';
  }
}

/// @nodoc
abstract mixin class _$PhotoSelectedCopyWith<$Res>
    implements $TryonStateCopyWith<$Res> {
  factory _$PhotoSelectedCopyWith(
          _PhotoSelected value, $Res Function(_PhotoSelected) _then) =
      __$PhotoSelectedCopyWithImpl;
  @useResult
  $Res call({XFile photo});
}

/// @nodoc
class __$PhotoSelectedCopyWithImpl<$Res>
    implements _$PhotoSelectedCopyWith<$Res> {
  __$PhotoSelectedCopyWithImpl(this._self, this._then);

  final _PhotoSelected _self;
  final $Res Function(_PhotoSelected) _then;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? photo = null,
  }) {
    return _then(_PhotoSelected(
      null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _Loading implements TryonState {
  const _Loading(this.photo);

  final XFile photo;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @override
  String toString() {
    return 'TryonState.loading(photo: $photo)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $TryonStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @useResult
  $Res call({XFile photo});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? photo = null,
  }) {
    return _then(_Loading(
      null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _Polling implements TryonState {
  const _Polling(this.photo, this.result);

  final XFile photo;
  final TryonResult result;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PollingCopyWith<_Polling> get copyWith =>
      __$PollingCopyWithImpl<_Polling>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Polling &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo, result);

  @override
  String toString() {
    return 'TryonState.polling(photo: $photo, result: $result)';
  }
}

/// @nodoc
abstract mixin class _$PollingCopyWith<$Res>
    implements $TryonStateCopyWith<$Res> {
  factory _$PollingCopyWith(_Polling value, $Res Function(_Polling) _then) =
      __$PollingCopyWithImpl;
  @useResult
  $Res call({XFile photo, TryonResult result});

  $TryonResultCopyWith<$Res> get result;
}

/// @nodoc
class __$PollingCopyWithImpl<$Res> implements _$PollingCopyWith<$Res> {
  __$PollingCopyWithImpl(this._self, this._then);

  final _Polling _self;
  final $Res Function(_Polling) _then;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? photo = null,
    Object? result = null,
  }) {
    return _then(_Polling(
      null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as XFile,
      null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as TryonResult,
    ));
  }

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TryonResultCopyWith<$Res> get result {
    return $TryonResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc

class _Success implements TryonState {
  const _Success(this.result);

  final TryonResult result;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'TryonState.success(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $TryonStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({TryonResult result});

  $TryonResultCopyWith<$Res> get result;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_Success(
      null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as TryonResult,
    ));
  }

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TryonResultCopyWith<$Res> get result {
    return $TryonResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc

class _ResultSaved implements TryonState {
  const _ResultSaved();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResultSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TryonState.resultSaved()';
  }
}

/// @nodoc

class _Error implements TryonState {
  const _Error(this.message);

  final String message;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TryonState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $TryonStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of TryonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
