part of 'point_bloc.dart';

@freezed
class PointState with _$PointState {
  const factory PointState.loading() = PointStateLoading;
  const factory PointState.loaded({required Point pointLoaded}) =
      PointStateLoaded;
  const factory PointState.error() = PointStateError;
}
