part of 'point_bloc.dart';

@freezed
class PointEvent with _$PointEvent {
  const factory PointEvent.fetch({
    required String id,
  }) = PointEventFetch;
}
