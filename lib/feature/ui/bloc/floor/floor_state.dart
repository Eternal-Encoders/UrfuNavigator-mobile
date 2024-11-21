part of 'floor_bloc.dart';

@freezed
class FloorState with _$FloorState {
  const factory FloorState.loading() = FloorStateLoading;
  const factory FloorState.loaded({required Floor floorLoaded}) =
      FloorStateLoaded;
  const factory FloorState.error() = FloorStateError;
}
