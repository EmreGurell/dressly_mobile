// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationEvent()';
  }
}

/// @nodoc
class $NotificationEventCopyWith<$Res> {
  $NotificationEventCopyWith(
      NotificationEvent _, $Res Function(NotificationEvent) __);
}

/// Adds pattern-matching-related methods to [NotificationEvent].
extension NotificationEventPatterns on NotificationEvent {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MarkRead value)? markRead,
    TResult Function(_MarkAllRead value)? markAllRead,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
      case _MarkRead() when markRead != null:
        return markRead(_that);
      case _MarkAllRead() when markAllRead != null:
        return markAllRead(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MarkRead value) markRead,
    required TResult Function(_MarkAllRead value) markAllRead,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(_that);
      case _MarkRead():
        return markRead(_that);
      case _MarkAllRead():
        return markAllRead(_that);
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MarkRead value)? markRead,
    TResult? Function(_MarkAllRead value)? markAllRead,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
      case _MarkRead() when markRead != null:
        return markRead(_that);
      case _MarkAllRead() when markAllRead != null:
        return markAllRead(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int id)? markRead,
    TResult Function()? markAllRead,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch();
      case _MarkRead() when markRead != null:
        return markRead(_that.id);
      case _MarkAllRead() when markAllRead != null:
        return markAllRead();
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int id) markRead,
    required TResult Function() markAllRead,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch();
      case _MarkRead():
        return markRead(_that.id);
      case _MarkAllRead():
        return markAllRead();
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int id)? markRead,
    TResult? Function()? markAllRead,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch();
      case _MarkRead() when markRead != null:
        return markRead(_that.id);
      case _MarkAllRead() when markAllRead != null:
        return markAllRead();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Fetch implements NotificationEvent {
  const _Fetch();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationEvent.fetch()';
  }
}

/// @nodoc

class _MarkRead implements NotificationEvent {
  const _MarkRead(this.id);

  final int id;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarkReadCopyWith<_MarkRead> get copyWith =>
      __$MarkReadCopyWithImpl<_MarkRead>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarkRead &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'NotificationEvent.markRead(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$MarkReadCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$MarkReadCopyWith(
          _MarkRead value, $Res Function(_MarkRead) _then) =
      __$MarkReadCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$MarkReadCopyWithImpl<$Res> implements _$MarkReadCopyWith<$Res> {
  __$MarkReadCopyWithImpl(this._self, this._then);

  final _MarkRead _self;
  final $Res Function(_MarkRead) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_MarkRead(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _MarkAllRead implements NotificationEvent {
  const _MarkAllRead();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _MarkAllRead);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationEvent.markAllRead()';
  }
}

// dart format on
