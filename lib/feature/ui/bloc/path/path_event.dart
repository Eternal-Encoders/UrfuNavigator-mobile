part of 'path_bloc.dart';

@freezed
class PathEvent with _$PathEvent {
  const factory PathEvent.fetch({
    required String from,
    required String to,
  }) = PathEventFetch;
}
