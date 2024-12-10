part of 'floor_bloc.dart';

@freezed
class FloorEvent with _$FloorEvent {
  const factory FloorEvent.fetch({
    required String floor,
    required String institute,
  }) = FloorEventFetch;
}
