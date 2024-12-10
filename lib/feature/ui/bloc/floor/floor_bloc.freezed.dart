// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloorEvent {
  String get floor => throw _privateConstructorUsedError;
  String get institute => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String floor, String institute) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String floor, String institute)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String floor, String institute)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FloorEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FloorEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FloorEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloorEventCopyWith<FloorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorEventCopyWith<$Res> {
  factory $FloorEventCopyWith(
          FloorEvent value, $Res Function(FloorEvent) then) =
      _$FloorEventCopyWithImpl<$Res, FloorEvent>;
  @useResult
  $Res call({String floor, String institute});
}

/// @nodoc
class _$FloorEventCopyWithImpl<$Res, $Val extends FloorEvent>
    implements $FloorEventCopyWith<$Res> {
  _$FloorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
    Object? institute = null,
  }) {
    return _then(_value.copyWith(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      institute: null == institute
          ? _value.institute
          : institute // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorEventFetchImplCopyWith<$Res>
    implements $FloorEventCopyWith<$Res> {
  factory _$$FloorEventFetchImplCopyWith(_$FloorEventFetchImpl value,
          $Res Function(_$FloorEventFetchImpl) then) =
      __$$FloorEventFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String floor, String institute});
}

/// @nodoc
class __$$FloorEventFetchImplCopyWithImpl<$Res>
    extends _$FloorEventCopyWithImpl<$Res, _$FloorEventFetchImpl>
    implements _$$FloorEventFetchImplCopyWith<$Res> {
  __$$FloorEventFetchImplCopyWithImpl(
      _$FloorEventFetchImpl _value, $Res Function(_$FloorEventFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
    Object? institute = null,
  }) {
    return _then(_$FloorEventFetchImpl(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      institute: null == institute
          ? _value.institute
          : institute // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FloorEventFetchImpl implements FloorEventFetch {
  const _$FloorEventFetchImpl({required this.floor, required this.institute});

  @override
  final String floor;
  @override
  final String institute;

  @override
  String toString() {
    return 'FloorEvent.fetch(floor: $floor, institute: $institute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorEventFetchImpl &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.institute, institute) ||
                other.institute == institute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floor, institute);

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorEventFetchImplCopyWith<_$FloorEventFetchImpl> get copyWith =>
      __$$FloorEventFetchImplCopyWithImpl<_$FloorEventFetchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String floor, String institute) fetch,
  }) {
    return fetch(floor, institute);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String floor, String institute)? fetch,
  }) {
    return fetch?.call(floor, institute);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String floor, String institute)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(floor, institute);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FloorEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FloorEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FloorEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FloorEventFetch implements FloorEvent {
  const factory FloorEventFetch(
      {required final String floor,
      required final String institute}) = _$FloorEventFetchImpl;

  @override
  String get floor;
  @override
  String get institute;

  /// Create a copy of FloorEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloorEventFetchImplCopyWith<_$FloorEventFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FloorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Floor floorLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Floor floorLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Floor floorLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FloorStateLoading value) loading,
    required TResult Function(FloorStateLoaded value) loaded,
    required TResult Function(FloorStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FloorStateLoading value)? loading,
    TResult? Function(FloorStateLoaded value)? loaded,
    TResult? Function(FloorStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FloorStateLoading value)? loading,
    TResult Function(FloorStateLoaded value)? loaded,
    TResult Function(FloorStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorStateCopyWith<$Res> {
  factory $FloorStateCopyWith(
          FloorState value, $Res Function(FloorState) then) =
      _$FloorStateCopyWithImpl<$Res, FloorState>;
}

/// @nodoc
class _$FloorStateCopyWithImpl<$Res, $Val extends FloorState>
    implements $FloorStateCopyWith<$Res> {
  _$FloorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FloorStateLoadingImplCopyWith<$Res> {
  factory _$$FloorStateLoadingImplCopyWith(_$FloorStateLoadingImpl value,
          $Res Function(_$FloorStateLoadingImpl) then) =
      __$$FloorStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FloorStateLoadingImplCopyWithImpl<$Res>
    extends _$FloorStateCopyWithImpl<$Res, _$FloorStateLoadingImpl>
    implements _$$FloorStateLoadingImplCopyWith<$Res> {
  __$$FloorStateLoadingImplCopyWithImpl(_$FloorStateLoadingImpl _value,
      $Res Function(_$FloorStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FloorStateLoadingImpl implements FloorStateLoading {
  const _$FloorStateLoadingImpl();

  @override
  String toString() {
    return 'FloorState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FloorStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Floor floorLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Floor floorLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Floor floorLoaded)? loaded,
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
    required TResult Function(FloorStateLoading value) loading,
    required TResult Function(FloorStateLoaded value) loaded,
    required TResult Function(FloorStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FloorStateLoading value)? loading,
    TResult? Function(FloorStateLoaded value)? loaded,
    TResult? Function(FloorStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FloorStateLoading value)? loading,
    TResult Function(FloorStateLoaded value)? loaded,
    TResult Function(FloorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FloorStateLoading implements FloorState {
  const factory FloorStateLoading() = _$FloorStateLoadingImpl;
}

/// @nodoc
abstract class _$$FloorStateLoadedImplCopyWith<$Res> {
  factory _$$FloorStateLoadedImplCopyWith(_$FloorStateLoadedImpl value,
          $Res Function(_$FloorStateLoadedImpl) then) =
      __$$FloorStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Floor floorLoaded});
}

/// @nodoc
class __$$FloorStateLoadedImplCopyWithImpl<$Res>
    extends _$FloorStateCopyWithImpl<$Res, _$FloorStateLoadedImpl>
    implements _$$FloorStateLoadedImplCopyWith<$Res> {
  __$$FloorStateLoadedImplCopyWithImpl(_$FloorStateLoadedImpl _value,
      $Res Function(_$FloorStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floorLoaded = null,
  }) {
    return _then(_$FloorStateLoadedImpl(
      floorLoaded: null == floorLoaded
          ? _value.floorLoaded
          : floorLoaded // ignore: cast_nullable_to_non_nullable
              as Floor,
    ));
  }
}

/// @nodoc

class _$FloorStateLoadedImpl implements FloorStateLoaded {
  const _$FloorStateLoadedImpl({required this.floorLoaded});

  @override
  final Floor floorLoaded;

  @override
  String toString() {
    return 'FloorState.loaded(floorLoaded: $floorLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorStateLoadedImpl &&
            (identical(other.floorLoaded, floorLoaded) ||
                other.floorLoaded == floorLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floorLoaded);

  /// Create a copy of FloorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorStateLoadedImplCopyWith<_$FloorStateLoadedImpl> get copyWith =>
      __$$FloorStateLoadedImplCopyWithImpl<_$FloorStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Floor floorLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(floorLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Floor floorLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(floorLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Floor floorLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(floorLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FloorStateLoading value) loading,
    required TResult Function(FloorStateLoaded value) loaded,
    required TResult Function(FloorStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FloorStateLoading value)? loading,
    TResult? Function(FloorStateLoaded value)? loaded,
    TResult? Function(FloorStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FloorStateLoading value)? loading,
    TResult Function(FloorStateLoaded value)? loaded,
    TResult Function(FloorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FloorStateLoaded implements FloorState {
  const factory FloorStateLoaded({required final Floor floorLoaded}) =
      _$FloorStateLoadedImpl;

  Floor get floorLoaded;

  /// Create a copy of FloorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloorStateLoadedImplCopyWith<_$FloorStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FloorStateErrorImplCopyWith<$Res> {
  factory _$$FloorStateErrorImplCopyWith(_$FloorStateErrorImpl value,
          $Res Function(_$FloorStateErrorImpl) then) =
      __$$FloorStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FloorStateErrorImplCopyWithImpl<$Res>
    extends _$FloorStateCopyWithImpl<$Res, _$FloorStateErrorImpl>
    implements _$$FloorStateErrorImplCopyWith<$Res> {
  __$$FloorStateErrorImplCopyWithImpl(
      _$FloorStateErrorImpl _value, $Res Function(_$FloorStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FloorStateErrorImpl implements FloorStateError {
  const _$FloorStateErrorImpl();

  @override
  String toString() {
    return 'FloorState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FloorStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Floor floorLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Floor floorLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Floor floorLoaded)? loaded,
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
    required TResult Function(FloorStateLoading value) loading,
    required TResult Function(FloorStateLoaded value) loaded,
    required TResult Function(FloorStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FloorStateLoading value)? loading,
    TResult? Function(FloorStateLoaded value)? loaded,
    TResult? Function(FloorStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FloorStateLoading value)? loading,
    TResult Function(FloorStateLoaded value)? loaded,
    TResult Function(FloorStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FloorStateError implements FloorState {
  const factory FloorStateError() = _$FloorStateErrorImpl;
}
