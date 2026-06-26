// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tryon_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TryonEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TryonEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TryonEvent()';
  }
}

/// @nodoc
class $TryonEventCopyWith<$Res> {
  $TryonEventCopyWith(TryonEvent _, $Res Function(TryonEvent) __);
}

/// Adds pattern-matching-related methods to [TryonEvent].
extension TryonEventPatterns on TryonEvent {
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
    TResult Function(_PhotoSelected value)? photoSelected,
    TResult Function(_TryOnRequested value)? tryOnRequested,
    TResult Function(_PollStatus value)? pollStatus,
    TResult Function(_SaveResult value)? saveResult,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that);
      case _TryOnRequested() when tryOnRequested != null:
        return tryOnRequested(_that);
      case _PollStatus() when pollStatus != null:
        return pollStatus(_that);
      case _SaveResult() when saveResult != null:
        return saveResult(_that);
      case _Reset() when reset != null:
        return reset(_that);
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
    required TResult Function(_PhotoSelected value) photoSelected,
    required TResult Function(_TryOnRequested value) tryOnRequested,
    required TResult Function(_PollStatus value) pollStatus,
    required TResult Function(_SaveResult value) saveResult,
    required TResult Function(_Reset value) reset,
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoSelected():
        return photoSelected(_that);
      case _TryOnRequested():
        return tryOnRequested(_that);
      case _PollStatus():
        return pollStatus(_that);
      case _SaveResult():
        return saveResult(_that);
      case _Reset():
        return reset(_that);
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
    TResult? Function(_PhotoSelected value)? photoSelected,
    TResult? Function(_TryOnRequested value)? tryOnRequested,
    TResult? Function(_PollStatus value)? pollStatus,
    TResult? Function(_SaveResult value)? saveResult,
    TResult? Function(_Reset value)? reset,
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that);
      case _TryOnRequested() when tryOnRequested != null:
        return tryOnRequested(_that);
      case _PollStatus() when pollStatus != null:
        return pollStatus(_that);
      case _SaveResult() when saveResult != null:
        return saveResult(_that);
      case _Reset() when reset != null:
        return reset(_that);
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
    TResult Function(XFile photo)? photoSelected,
    TResult Function(int productId)? tryOnRequested,
    TResult Function(int tryonId)? pollStatus,
    TResult Function()? saveResult,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that.photo);
      case _TryOnRequested() when tryOnRequested != null:
        return tryOnRequested(_that.productId);
      case _PollStatus() when pollStatus != null:
        return pollStatus(_that.tryonId);
      case _SaveResult() when saveResult != null:
        return saveResult();
      case _Reset() when reset != null:
        return reset();
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
    required TResult Function(XFile photo) photoSelected,
    required TResult Function(int productId) tryOnRequested,
    required TResult Function(int tryonId) pollStatus,
    required TResult Function() saveResult,
    required TResult Function() reset,
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoSelected():
        return photoSelected(_that.photo);
      case _TryOnRequested():
        return tryOnRequested(_that.productId);
      case _PollStatus():
        return pollStatus(_that.tryonId);
      case _SaveResult():
        return saveResult();
      case _Reset():
        return reset();
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
    TResult? Function(XFile photo)? photoSelected,
    TResult? Function(int productId)? tryOnRequested,
    TResult? Function(int tryonId)? pollStatus,
    TResult? Function()? saveResult,
    TResult? Function()? reset,
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoSelected() when photoSelected != null:
        return photoSelected(_that.photo);
      case _TryOnRequested() when tryOnRequested != null:
        return tryOnRequested(_that.productId);
      case _PollStatus() when pollStatus != null:
        return pollStatus(_that.tryonId);
      case _SaveResult() when saveResult != null:
        return saveResult();
      case _Reset() when reset != null:
        return reset();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PhotoSelected implements TryonEvent {
  const _PhotoSelected(this.photo);

  final XFile photo;

  /// Create a copy of TryonEvent
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
    return 'TryonEvent.photoSelected(photo: $photo)';
  }
}

/// @nodoc
abstract mixin class _$PhotoSelectedCopyWith<$Res>
    implements $TryonEventCopyWith<$Res> {
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

  /// Create a copy of TryonEvent
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

class _TryOnRequested implements TryonEvent {
  const _TryOnRequested(this.productId);

  final int productId;

  /// Create a copy of TryonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TryOnRequestedCopyWith<_TryOnRequested> get copyWith =>
      __$TryOnRequestedCopyWithImpl<_TryOnRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TryOnRequested &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'TryonEvent.tryOnRequested(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class _$TryOnRequestedCopyWith<$Res>
    implements $TryonEventCopyWith<$Res> {
  factory _$TryOnRequestedCopyWith(
          _TryOnRequested value, $Res Function(_TryOnRequested) _then) =
      __$TryOnRequestedCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$TryOnRequestedCopyWithImpl<$Res>
    implements _$TryOnRequestedCopyWith<$Res> {
  __$TryOnRequestedCopyWithImpl(this._self, this._then);

  final _TryOnRequested _self;
  final $Res Function(_TryOnRequested) _then;

  /// Create a copy of TryonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(_TryOnRequested(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _PollStatus implements TryonEvent {
  const _PollStatus(this.tryonId);

  final int tryonId;

  /// Create a copy of TryonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PollStatusCopyWith<_PollStatus> get copyWith =>
      __$PollStatusCopyWithImpl<_PollStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PollStatus &&
            (identical(other.tryonId, tryonId) || other.tryonId == tryonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tryonId);

  @override
  String toString() {
    return 'TryonEvent.pollStatus(tryonId: $tryonId)';
  }
}

/// @nodoc
abstract mixin class _$PollStatusCopyWith<$Res>
    implements $TryonEventCopyWith<$Res> {
  factory _$PollStatusCopyWith(
          _PollStatus value, $Res Function(_PollStatus) _then) =
      __$PollStatusCopyWithImpl;
  @useResult
  $Res call({int tryonId});
}

/// @nodoc
class __$PollStatusCopyWithImpl<$Res> implements _$PollStatusCopyWith<$Res> {
  __$PollStatusCopyWithImpl(this._self, this._then);

  final _PollStatus _self;
  final $Res Function(_PollStatus) _then;

  /// Create a copy of TryonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tryonId = null,
  }) {
    return _then(_PollStatus(
      null == tryonId
          ? _self.tryonId
          : tryonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SaveResult implements TryonEvent {
  const _SaveResult();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SaveResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TryonEvent.saveResult()';
  }
}

/// @nodoc

class _Reset implements TryonEvent {
  const _Reset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TryonEvent.reset()';
  }
}

// dart format on
