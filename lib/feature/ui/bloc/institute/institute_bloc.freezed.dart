// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institute_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InstituteEvent {
  String get url => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstituteEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstituteEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstituteEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of InstituteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstituteEventCopyWith<InstituteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstituteEventCopyWith<$Res> {
  factory $InstituteEventCopyWith(
          InstituteEvent value, $Res Function(InstituteEvent) then) =
      _$InstituteEventCopyWithImpl<$Res, InstituteEvent>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$InstituteEventCopyWithImpl<$Res, $Val extends InstituteEvent>
    implements $InstituteEventCopyWith<$Res> {
  _$InstituteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstituteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstituteEventFetchImplCopyWith<$Res>
    implements $InstituteEventCopyWith<$Res> {
  factory _$$InstituteEventFetchImplCopyWith(_$InstituteEventFetchImpl value,
          $Res Function(_$InstituteEventFetchImpl) then) =
      __$$InstituteEventFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$InstituteEventFetchImplCopyWithImpl<$Res>
    extends _$InstituteEventCopyWithImpl<$Res, _$InstituteEventFetchImpl>
    implements _$$InstituteEventFetchImplCopyWith<$Res> {
  __$$InstituteEventFetchImplCopyWithImpl(_$InstituteEventFetchImpl _value,
      $Res Function(_$InstituteEventFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstituteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$InstituteEventFetchImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InstituteEventFetchImpl implements InstituteEventFetch {
  const _$InstituteEventFetchImpl({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'InstituteEvent.fetch(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstituteEventFetchImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of InstituteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstituteEventFetchImplCopyWith<_$InstituteEventFetchImpl> get copyWith =>
      __$$InstituteEventFetchImplCopyWithImpl<_$InstituteEventFetchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) fetch,
  }) {
    return fetch(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? fetch,
  }) {
    return fetch?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstituteEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstituteEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstituteEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class InstituteEventFetch implements InstituteEvent {
  const factory InstituteEventFetch({required final String url}) =
      _$InstituteEventFetchImpl;

  @override
  String get url;

  /// Create a copy of InstituteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstituteEventFetchImplCopyWith<_$InstituteEventFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InstituteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Institute instituteLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Institute instituteLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Institute instituteLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstituteStateLoading value) loading,
    required TResult Function(InstituteStateLoaded value) loaded,
    required TResult Function(InstituteStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstituteStateLoading value)? loading,
    TResult? Function(InstituteStateLoaded value)? loaded,
    TResult? Function(InstituteStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstituteStateLoading value)? loading,
    TResult Function(InstituteStateLoaded value)? loaded,
    TResult Function(InstituteStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstituteStateCopyWith<$Res> {
  factory $InstituteStateCopyWith(
          InstituteState value, $Res Function(InstituteState) then) =
      _$InstituteStateCopyWithImpl<$Res, InstituteState>;
}

/// @nodoc
class _$InstituteStateCopyWithImpl<$Res, $Val extends InstituteState>
    implements $InstituteStateCopyWith<$Res> {
  _$InstituteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstituteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InstituteStateLoadingImplCopyWith<$Res> {
  factory _$$InstituteStateLoadingImplCopyWith(
          _$InstituteStateLoadingImpl value,
          $Res Function(_$InstituteStateLoadingImpl) then) =
      __$$InstituteStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InstituteStateLoadingImplCopyWithImpl<$Res>
    extends _$InstituteStateCopyWithImpl<$Res, _$InstituteStateLoadingImpl>
    implements _$$InstituteStateLoadingImplCopyWith<$Res> {
  __$$InstituteStateLoadingImplCopyWithImpl(_$InstituteStateLoadingImpl _value,
      $Res Function(_$InstituteStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstituteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InstituteStateLoadingImpl implements InstituteStateLoading {
  const _$InstituteStateLoadingImpl();

  @override
  String toString() {
    return 'InstituteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstituteStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Institute instituteLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Institute instituteLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Institute instituteLoaded)? loaded,
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
    required TResult Function(InstituteStateLoading value) loading,
    required TResult Function(InstituteStateLoaded value) loaded,
    required TResult Function(InstituteStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstituteStateLoading value)? loading,
    TResult? Function(InstituteStateLoaded value)? loaded,
    TResult? Function(InstituteStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstituteStateLoading value)? loading,
    TResult Function(InstituteStateLoaded value)? loaded,
    TResult Function(InstituteStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InstituteStateLoading implements InstituteState {
  const factory InstituteStateLoading() = _$InstituteStateLoadingImpl;
}

/// @nodoc
abstract class _$$InstituteStateLoadedImplCopyWith<$Res> {
  factory _$$InstituteStateLoadedImplCopyWith(_$InstituteStateLoadedImpl value,
          $Res Function(_$InstituteStateLoadedImpl) then) =
      __$$InstituteStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Institute instituteLoaded});
}

/// @nodoc
class __$$InstituteStateLoadedImplCopyWithImpl<$Res>
    extends _$InstituteStateCopyWithImpl<$Res, _$InstituteStateLoadedImpl>
    implements _$$InstituteStateLoadedImplCopyWith<$Res> {
  __$$InstituteStateLoadedImplCopyWithImpl(_$InstituteStateLoadedImpl _value,
      $Res Function(_$InstituteStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstituteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituteLoaded = null,
  }) {
    return _then(_$InstituteStateLoadedImpl(
      instituteLoaded: null == instituteLoaded
          ? _value.instituteLoaded
          : instituteLoaded // ignore: cast_nullable_to_non_nullable
              as Institute,
    ));
  }
}

/// @nodoc

class _$InstituteStateLoadedImpl implements InstituteStateLoaded {
  const _$InstituteStateLoadedImpl({required this.instituteLoaded});

  @override
  final Institute instituteLoaded;

  @override
  String toString() {
    return 'InstituteState.loaded(instituteLoaded: $instituteLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstituteStateLoadedImpl &&
            (identical(other.instituteLoaded, instituteLoaded) ||
                other.instituteLoaded == instituteLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instituteLoaded);

  /// Create a copy of InstituteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstituteStateLoadedImplCopyWith<_$InstituteStateLoadedImpl>
      get copyWith =>
          __$$InstituteStateLoadedImplCopyWithImpl<_$InstituteStateLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Institute instituteLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(instituteLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Institute instituteLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(instituteLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Institute instituteLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(instituteLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstituteStateLoading value) loading,
    required TResult Function(InstituteStateLoaded value) loaded,
    required TResult Function(InstituteStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstituteStateLoading value)? loading,
    TResult? Function(InstituteStateLoaded value)? loaded,
    TResult? Function(InstituteStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstituteStateLoading value)? loading,
    TResult Function(InstituteStateLoaded value)? loaded,
    TResult Function(InstituteStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class InstituteStateLoaded implements InstituteState {
  const factory InstituteStateLoaded(
      {required final Institute instituteLoaded}) = _$InstituteStateLoadedImpl;

  Institute get instituteLoaded;

  /// Create a copy of InstituteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstituteStateLoadedImplCopyWith<_$InstituteStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InstituteStateErrorImplCopyWith<$Res> {
  factory _$$InstituteStateErrorImplCopyWith(_$InstituteStateErrorImpl value,
          $Res Function(_$InstituteStateErrorImpl) then) =
      __$$InstituteStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InstituteStateErrorImplCopyWithImpl<$Res>
    extends _$InstituteStateCopyWithImpl<$Res, _$InstituteStateErrorImpl>
    implements _$$InstituteStateErrorImplCopyWith<$Res> {
  __$$InstituteStateErrorImplCopyWithImpl(_$InstituteStateErrorImpl _value,
      $Res Function(_$InstituteStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstituteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InstituteStateErrorImpl implements InstituteStateError {
  const _$InstituteStateErrorImpl();

  @override
  String toString() {
    return 'InstituteState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstituteStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Institute instituteLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Institute instituteLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Institute instituteLoaded)? loaded,
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
    required TResult Function(InstituteStateLoading value) loading,
    required TResult Function(InstituteStateLoaded value) loaded,
    required TResult Function(InstituteStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstituteStateLoading value)? loading,
    TResult? Function(InstituteStateLoaded value)? loaded,
    TResult? Function(InstituteStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstituteStateLoading value)? loading,
    TResult Function(InstituteStateLoaded value)? loaded,
    TResult Function(InstituteStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InstituteStateError implements InstituteState {
  const factory InstituteStateError() = _$InstituteStateErrorImpl;
}
