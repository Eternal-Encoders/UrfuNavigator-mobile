// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institutes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InstitutesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstitutesEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstitutesEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstitutesEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutesEventCopyWith<$Res> {
  factory $InstitutesEventCopyWith(
          InstitutesEvent value, $Res Function(InstitutesEvent) then) =
      _$InstitutesEventCopyWithImpl<$Res, InstitutesEvent>;
}

/// @nodoc
class _$InstitutesEventCopyWithImpl<$Res, $Val extends InstitutesEvent>
    implements $InstitutesEventCopyWith<$Res> {
  _$InstitutesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstitutesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InstitutesEventFetchImplCopyWith<$Res> {
  factory _$$InstitutesEventFetchImplCopyWith(_$InstitutesEventFetchImpl value,
          $Res Function(_$InstitutesEventFetchImpl) then) =
      __$$InstitutesEventFetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InstitutesEventFetchImplCopyWithImpl<$Res>
    extends _$InstitutesEventCopyWithImpl<$Res, _$InstitutesEventFetchImpl>
    implements _$$InstitutesEventFetchImplCopyWith<$Res> {
  __$$InstitutesEventFetchImplCopyWithImpl(_$InstitutesEventFetchImpl _value,
      $Res Function(_$InstitutesEventFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstitutesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InstitutesEventFetchImpl implements InstitutesEventFetch {
  const _$InstitutesEventFetchImpl();

  @override
  String toString() {
    return 'InstitutesEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstitutesEventFetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstitutesEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstitutesEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstitutesEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class InstitutesEventFetch implements InstitutesEvent {
  const factory InstitutesEventFetch() = _$InstitutesEventFetchImpl;
}

/// @nodoc
mixin _$InstitutesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(InstitutesList institutesLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(InstitutesList institutesLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(InstitutesList institutesLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstitutesStateLoading value) loading,
    required TResult Function(InstitutesStateLoaded value) loaded,
    required TResult Function(InstitutesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstitutesStateLoading value)? loading,
    TResult? Function(InstitutesStateLoaded value)? loaded,
    TResult? Function(InstitutesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstitutesStateLoading value)? loading,
    TResult Function(InstitutesStateLoaded value)? loaded,
    TResult Function(InstitutesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutesStateCopyWith<$Res> {
  factory $InstitutesStateCopyWith(
          InstitutesState value, $Res Function(InstitutesState) then) =
      _$InstitutesStateCopyWithImpl<$Res, InstitutesState>;
}

/// @nodoc
class _$InstitutesStateCopyWithImpl<$Res, $Val extends InstitutesState>
    implements $InstitutesStateCopyWith<$Res> {
  _$InstitutesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstitutesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InstitutesStateLoadingImplCopyWith<$Res> {
  factory _$$InstitutesStateLoadingImplCopyWith(
          _$InstitutesStateLoadingImpl value,
          $Res Function(_$InstitutesStateLoadingImpl) then) =
      __$$InstitutesStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InstitutesStateLoadingImplCopyWithImpl<$Res>
    extends _$InstitutesStateCopyWithImpl<$Res, _$InstitutesStateLoadingImpl>
    implements _$$InstitutesStateLoadingImplCopyWith<$Res> {
  __$$InstitutesStateLoadingImplCopyWithImpl(
      _$InstitutesStateLoadingImpl _value,
      $Res Function(_$InstitutesStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstitutesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InstitutesStateLoadingImpl implements InstitutesStateLoading {
  const _$InstitutesStateLoadingImpl();

  @override
  String toString() {
    return 'InstitutesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstitutesStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(InstitutesList institutesLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(InstitutesList institutesLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(InstitutesList institutesLoaded)? loaded,
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
    required TResult Function(InstitutesStateLoading value) loading,
    required TResult Function(InstitutesStateLoaded value) loaded,
    required TResult Function(InstitutesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstitutesStateLoading value)? loading,
    TResult? Function(InstitutesStateLoaded value)? loaded,
    TResult? Function(InstitutesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstitutesStateLoading value)? loading,
    TResult Function(InstitutesStateLoaded value)? loaded,
    TResult Function(InstitutesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InstitutesStateLoading implements InstitutesState {
  const factory InstitutesStateLoading() = _$InstitutesStateLoadingImpl;
}

/// @nodoc
abstract class _$$InstitutesStateLoadedImplCopyWith<$Res> {
  factory _$$InstitutesStateLoadedImplCopyWith(
          _$InstitutesStateLoadedImpl value,
          $Res Function(_$InstitutesStateLoadedImpl) then) =
      __$$InstitutesStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InstitutesList institutesLoaded});
}

/// @nodoc
class __$$InstitutesStateLoadedImplCopyWithImpl<$Res>
    extends _$InstitutesStateCopyWithImpl<$Res, _$InstitutesStateLoadedImpl>
    implements _$$InstitutesStateLoadedImplCopyWith<$Res> {
  __$$InstitutesStateLoadedImplCopyWithImpl(_$InstitutesStateLoadedImpl _value,
      $Res Function(_$InstitutesStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstitutesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? institutesLoaded = null,
  }) {
    return _then(_$InstitutesStateLoadedImpl(
      institutesLoaded: null == institutesLoaded
          ? _value.institutesLoaded
          : institutesLoaded // ignore: cast_nullable_to_non_nullable
              as InstitutesList,
    ));
  }
}

/// @nodoc

class _$InstitutesStateLoadedImpl implements InstitutesStateLoaded {
  const _$InstitutesStateLoadedImpl({required this.institutesLoaded});

  @override
  final InstitutesList institutesLoaded;

  @override
  String toString() {
    return 'InstitutesState.loaded(institutesLoaded: $institutesLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstitutesStateLoadedImpl &&
            (identical(other.institutesLoaded, institutesLoaded) ||
                other.institutesLoaded == institutesLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, institutesLoaded);

  /// Create a copy of InstitutesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstitutesStateLoadedImplCopyWith<_$InstitutesStateLoadedImpl>
      get copyWith => __$$InstitutesStateLoadedImplCopyWithImpl<
          _$InstitutesStateLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(InstitutesList institutesLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(institutesLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(InstitutesList institutesLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(institutesLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(InstitutesList institutesLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(institutesLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstitutesStateLoading value) loading,
    required TResult Function(InstitutesStateLoaded value) loaded,
    required TResult Function(InstitutesStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstitutesStateLoading value)? loading,
    TResult? Function(InstitutesStateLoaded value)? loaded,
    TResult? Function(InstitutesStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstitutesStateLoading value)? loading,
    TResult Function(InstitutesStateLoaded value)? loaded,
    TResult Function(InstitutesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class InstitutesStateLoaded implements InstitutesState {
  const factory InstitutesStateLoaded(
          {required final InstitutesList institutesLoaded}) =
      _$InstitutesStateLoadedImpl;

  InstitutesList get institutesLoaded;

  /// Create a copy of InstitutesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstitutesStateLoadedImplCopyWith<_$InstitutesStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InstitutesStateErrorImplCopyWith<$Res> {
  factory _$$InstitutesStateErrorImplCopyWith(_$InstitutesStateErrorImpl value,
          $Res Function(_$InstitutesStateErrorImpl) then) =
      __$$InstitutesStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InstitutesStateErrorImplCopyWithImpl<$Res>
    extends _$InstitutesStateCopyWithImpl<$Res, _$InstitutesStateErrorImpl>
    implements _$$InstitutesStateErrorImplCopyWith<$Res> {
  __$$InstitutesStateErrorImplCopyWithImpl(_$InstitutesStateErrorImpl _value,
      $Res Function(_$InstitutesStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstitutesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InstitutesStateErrorImpl implements InstitutesStateError {
  const _$InstitutesStateErrorImpl();

  @override
  String toString() {
    return 'InstitutesState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstitutesStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(InstitutesList institutesLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(InstitutesList institutesLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(InstitutesList institutesLoaded)? loaded,
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
    required TResult Function(InstitutesStateLoading value) loading,
    required TResult Function(InstitutesStateLoaded value) loaded,
    required TResult Function(InstitutesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstitutesStateLoading value)? loading,
    TResult? Function(InstitutesStateLoaded value)? loaded,
    TResult? Function(InstitutesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstitutesStateLoading value)? loading,
    TResult Function(InstitutesStateLoaded value)? loaded,
    TResult Function(InstitutesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InstitutesStateError implements InstitutesState {
  const factory InstitutesStateError() = _$InstitutesStateErrorImpl;
}
