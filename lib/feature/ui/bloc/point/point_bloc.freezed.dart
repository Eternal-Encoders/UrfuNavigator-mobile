// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PointEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PointEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointEventCopyWith<PointEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointEventCopyWith<$Res> {
  factory $PointEventCopyWith(
          PointEvent value, $Res Function(PointEvent) then) =
      _$PointEventCopyWithImpl<$Res, PointEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$PointEventCopyWithImpl<$Res, $Val extends PointEvent>
    implements $PointEventCopyWith<$Res> {
  _$PointEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointEventFetchImplCopyWith<$Res>
    implements $PointEventCopyWith<$Res> {
  factory _$$PointEventFetchImplCopyWith(_$PointEventFetchImpl value,
          $Res Function(_$PointEventFetchImpl) then) =
      __$$PointEventFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$PointEventFetchImplCopyWithImpl<$Res>
    extends _$PointEventCopyWithImpl<$Res, _$PointEventFetchImpl>
    implements _$$PointEventFetchImplCopyWith<$Res> {
  __$$PointEventFetchImplCopyWithImpl(
      _$PointEventFetchImpl _value, $Res Function(_$PointEventFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$PointEventFetchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PointEventFetchImpl implements PointEventFetch {
  const _$PointEventFetchImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'PointEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointEventFetchImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of PointEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointEventFetchImplCopyWith<_$PointEventFetchImpl> get copyWith =>
      __$$PointEventFetchImplCopyWithImpl<_$PointEventFetchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetch,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class PointEventFetch implements PointEvent {
  const factory PointEventFetch({required final String id}) =
      _$PointEventFetchImpl;

  @override
  String get id;

  /// Create a copy of PointEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointEventFetchImplCopyWith<_$PointEventFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PointState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Point pointLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Point pointLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Point pointLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointStateLoading value) loading,
    required TResult Function(PointStateLoaded value) loaded,
    required TResult Function(PointStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointStateLoading value)? loading,
    TResult? Function(PointStateLoaded value)? loaded,
    TResult? Function(PointStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointStateLoading value)? loading,
    TResult Function(PointStateLoaded value)? loaded,
    TResult Function(PointStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointStateCopyWith<$Res> {
  factory $PointStateCopyWith(
          PointState value, $Res Function(PointState) then) =
      _$PointStateCopyWithImpl<$Res, PointState>;
}

/// @nodoc
class _$PointStateCopyWithImpl<$Res, $Val extends PointState>
    implements $PointStateCopyWith<$Res> {
  _$PointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PointStateLoadingImplCopyWith<$Res> {
  factory _$$PointStateLoadingImplCopyWith(_$PointStateLoadingImpl value,
          $Res Function(_$PointStateLoadingImpl) then) =
      __$$PointStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PointStateLoadingImplCopyWithImpl<$Res>
    extends _$PointStateCopyWithImpl<$Res, _$PointStateLoadingImpl>
    implements _$$PointStateLoadingImplCopyWith<$Res> {
  __$$PointStateLoadingImplCopyWithImpl(_$PointStateLoadingImpl _value,
      $Res Function(_$PointStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PointStateLoadingImpl implements PointStateLoading {
  const _$PointStateLoadingImpl();

  @override
  String toString() {
    return 'PointState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PointStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Point pointLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Point pointLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Point pointLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointStateLoading value) loading,
    required TResult Function(PointStateLoaded value) loaded,
    required TResult Function(PointStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointStateLoading value)? loading,
    TResult? Function(PointStateLoaded value)? loaded,
    TResult? Function(PointStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointStateLoading value)? loading,
    TResult Function(PointStateLoaded value)? loaded,
    TResult Function(PointStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PointStateLoading implements PointState {
  const factory PointStateLoading() = _$PointStateLoadingImpl;
}

/// @nodoc
abstract class _$$PointStateLoadedImplCopyWith<$Res> {
  factory _$$PointStateLoadedImplCopyWith(_$PointStateLoadedImpl value,
          $Res Function(_$PointStateLoadedImpl) then) =
      __$$PointStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Point pointLoaded});
}

/// @nodoc
class __$$PointStateLoadedImplCopyWithImpl<$Res>
    extends _$PointStateCopyWithImpl<$Res, _$PointStateLoadedImpl>
    implements _$$PointStateLoadedImplCopyWith<$Res> {
  __$$PointStateLoadedImplCopyWithImpl(_$PointStateLoadedImpl _value,
      $Res Function(_$PointStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointLoaded = null,
  }) {
    return _then(_$PointStateLoadedImpl(
      pointLoaded: null == pointLoaded
          ? _value.pointLoaded
          : pointLoaded // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc

class _$PointStateLoadedImpl implements PointStateLoaded {
  const _$PointStateLoadedImpl({required this.pointLoaded});

  @override
  final Point pointLoaded;

  @override
  String toString() {
    return 'PointState.loaded(pointLoaded: $pointLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointStateLoadedImpl &&
            (identical(other.pointLoaded, pointLoaded) ||
                other.pointLoaded == pointLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pointLoaded);

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointStateLoadedImplCopyWith<_$PointStateLoadedImpl> get copyWith =>
      __$$PointStateLoadedImplCopyWithImpl<_$PointStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Point pointLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(pointLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Point pointLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(pointLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Point pointLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pointLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointStateLoading value) loading,
    required TResult Function(PointStateLoaded value) loaded,
    required TResult Function(PointStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointStateLoading value)? loading,
    TResult? Function(PointStateLoaded value)? loaded,
    TResult? Function(PointStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointStateLoading value)? loading,
    TResult Function(PointStateLoaded value)? loaded,
    TResult Function(PointStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PointStateLoaded implements PointState {
  const factory PointStateLoaded({required final Point pointLoaded}) =
      _$PointStateLoadedImpl;

  Point get pointLoaded;

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointStateLoadedImplCopyWith<_$PointStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PointStateErrorImplCopyWith<$Res> {
  factory _$$PointStateErrorImplCopyWith(_$PointStateErrorImpl value,
          $Res Function(_$PointStateErrorImpl) then) =
      __$$PointStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PointStateErrorImplCopyWithImpl<$Res>
    extends _$PointStateCopyWithImpl<$Res, _$PointStateErrorImpl>
    implements _$$PointStateErrorImplCopyWith<$Res> {
  __$$PointStateErrorImplCopyWithImpl(
      _$PointStateErrorImpl _value, $Res Function(_$PointStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PointStateErrorImpl implements PointStateError {
  const _$PointStateErrorImpl();

  @override
  String toString() {
    return 'PointState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PointStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Point pointLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Point pointLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Point pointLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointStateLoading value) loading,
    required TResult Function(PointStateLoaded value) loaded,
    required TResult Function(PointStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointStateLoading value)? loading,
    TResult? Function(PointStateLoaded value)? loaded,
    TResult? Function(PointStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointStateLoading value)? loading,
    TResult Function(PointStateLoaded value)? loaded,
    TResult Function(PointStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PointStateError implements PointState {
  const factory PointStateError() = _$PointStateErrorImpl;
}
