// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PathEvent {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String from, String to) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String from, String to)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String from, String to)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PathEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PathEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PathEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PathEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathEventCopyWith<PathEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathEventCopyWith<$Res> {
  factory $PathEventCopyWith(PathEvent value, $Res Function(PathEvent) then) =
      _$PathEventCopyWithImpl<$Res, PathEvent>;
  @useResult
  $Res call({String from, String to});
}

/// @nodoc
class _$PathEventCopyWithImpl<$Res, $Val extends PathEvent>
    implements $PathEventCopyWith<$Res> {
  _$PathEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PathEventFetchImplCopyWith<$Res>
    implements $PathEventCopyWith<$Res> {
  factory _$$PathEventFetchImplCopyWith(_$PathEventFetchImpl value,
          $Res Function(_$PathEventFetchImpl) then) =
      __$$PathEventFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to});
}

/// @nodoc
class __$$PathEventFetchImplCopyWithImpl<$Res>
    extends _$PathEventCopyWithImpl<$Res, _$PathEventFetchImpl>
    implements _$$PathEventFetchImplCopyWith<$Res> {
  __$$PathEventFetchImplCopyWithImpl(
      _$PathEventFetchImpl _value, $Res Function(_$PathEventFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PathEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$PathEventFetchImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PathEventFetchImpl implements PathEventFetch {
  const _$PathEventFetchImpl({required this.from, required this.to});

  @override
  final String from;
  @override
  final String to;

  @override
  String toString() {
    return 'PathEvent.fetch(from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathEventFetchImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  /// Create a copy of PathEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathEventFetchImplCopyWith<_$PathEventFetchImpl> get copyWith =>
      __$$PathEventFetchImplCopyWithImpl<_$PathEventFetchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String from, String to) fetch,
  }) {
    return fetch(from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String from, String to)? fetch,
  }) {
    return fetch?.call(from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String from, String to)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PathEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PathEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PathEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class PathEventFetch implements PathEvent {
  const factory PathEventFetch(
      {required final String from,
      required final String to}) = _$PathEventFetchImpl;

  @override
  String get from;
  @override
  String get to;

  /// Create a copy of PathEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathEventFetchImplCopyWith<_$PathEventFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PathState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Path pathLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Path pathLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Path pathLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PathStateLoading value) loading,
    required TResult Function(PathStateLoaded value) loaded,
    required TResult Function(PathStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PathStateLoading value)? loading,
    TResult? Function(PathStateLoaded value)? loaded,
    TResult? Function(PathStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PathStateLoading value)? loading,
    TResult Function(PathStateLoaded value)? loaded,
    TResult Function(PathStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathStateCopyWith<$Res> {
  factory $PathStateCopyWith(PathState value, $Res Function(PathState) then) =
      _$PathStateCopyWithImpl<$Res, PathState>;
}

/// @nodoc
class _$PathStateCopyWithImpl<$Res, $Val extends PathState>
    implements $PathStateCopyWith<$Res> {
  _$PathStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PathStateLoadingImplCopyWith<$Res> {
  factory _$$PathStateLoadingImplCopyWith(_$PathStateLoadingImpl value,
          $Res Function(_$PathStateLoadingImpl) then) =
      __$$PathStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PathStateLoadingImplCopyWithImpl<$Res>
    extends _$PathStateCopyWithImpl<$Res, _$PathStateLoadingImpl>
    implements _$$PathStateLoadingImplCopyWith<$Res> {
  __$$PathStateLoadingImplCopyWithImpl(_$PathStateLoadingImpl _value,
      $Res Function(_$PathStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PathState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PathStateLoadingImpl implements PathStateLoading {
  const _$PathStateLoadingImpl();

  @override
  String toString() {
    return 'PathState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PathStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Path pathLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Path pathLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Path pathLoaded)? loaded,
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
    required TResult Function(PathStateLoading value) loading,
    required TResult Function(PathStateLoaded value) loaded,
    required TResult Function(PathStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PathStateLoading value)? loading,
    TResult? Function(PathStateLoaded value)? loaded,
    TResult? Function(PathStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PathStateLoading value)? loading,
    TResult Function(PathStateLoaded value)? loaded,
    TResult Function(PathStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PathStateLoading implements PathState {
  const factory PathStateLoading() = _$PathStateLoadingImpl;
}

/// @nodoc
abstract class _$$PathStateLoadedImplCopyWith<$Res> {
  factory _$$PathStateLoadedImplCopyWith(_$PathStateLoadedImpl value,
          $Res Function(_$PathStateLoadedImpl) then) =
      __$$PathStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Path pathLoaded});
}

/// @nodoc
class __$$PathStateLoadedImplCopyWithImpl<$Res>
    extends _$PathStateCopyWithImpl<$Res, _$PathStateLoadedImpl>
    implements _$$PathStateLoadedImplCopyWith<$Res> {
  __$$PathStateLoadedImplCopyWithImpl(
      _$PathStateLoadedImpl _value, $Res Function(_$PathStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PathState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathLoaded = null,
  }) {
    return _then(_$PathStateLoadedImpl(
      pathLoaded: null == pathLoaded
          ? _value.pathLoaded
          : pathLoaded // ignore: cast_nullable_to_non_nullable
              as Path,
    ));
  }
}

/// @nodoc

class _$PathStateLoadedImpl implements PathStateLoaded {
  const _$PathStateLoadedImpl({required this.pathLoaded});

  @override
  final Path pathLoaded;

  @override
  String toString() {
    return 'PathState.loaded(pathLoaded: $pathLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathStateLoadedImpl &&
            (identical(other.pathLoaded, pathLoaded) ||
                other.pathLoaded == pathLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pathLoaded);

  /// Create a copy of PathState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathStateLoadedImplCopyWith<_$PathStateLoadedImpl> get copyWith =>
      __$$PathStateLoadedImplCopyWithImpl<_$PathStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Path pathLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(pathLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Path pathLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(pathLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Path pathLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pathLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PathStateLoading value) loading,
    required TResult Function(PathStateLoaded value) loaded,
    required TResult Function(PathStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PathStateLoading value)? loading,
    TResult? Function(PathStateLoaded value)? loaded,
    TResult? Function(PathStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PathStateLoading value)? loading,
    TResult Function(PathStateLoaded value)? loaded,
    TResult Function(PathStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PathStateLoaded implements PathState {
  const factory PathStateLoaded({required final Path pathLoaded}) =
      _$PathStateLoadedImpl;

  Path get pathLoaded;

  /// Create a copy of PathState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathStateLoadedImplCopyWith<_$PathStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PathStateErrorImplCopyWith<$Res> {
  factory _$$PathStateErrorImplCopyWith(_$PathStateErrorImpl value,
          $Res Function(_$PathStateErrorImpl) then) =
      __$$PathStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PathStateErrorImplCopyWithImpl<$Res>
    extends _$PathStateCopyWithImpl<$Res, _$PathStateErrorImpl>
    implements _$$PathStateErrorImplCopyWith<$Res> {
  __$$PathStateErrorImplCopyWithImpl(
      _$PathStateErrorImpl _value, $Res Function(_$PathStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PathState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PathStateErrorImpl implements PathStateError {
  const _$PathStateErrorImpl();

  @override
  String toString() {
    return 'PathState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PathStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Path pathLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Path pathLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Path pathLoaded)? loaded,
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
    required TResult Function(PathStateLoading value) loading,
    required TResult Function(PathStateLoaded value) loaded,
    required TResult Function(PathStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PathStateLoading value)? loading,
    TResult? Function(PathStateLoaded value)? loaded,
    TResult? Function(PathStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PathStateLoading value)? loading,
    TResult Function(PathStateLoaded value)? loaded,
    TResult Function(PathStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PathStateError implements PathState {
  const factory PathStateError() = _$PathStateErrorImpl;
}
