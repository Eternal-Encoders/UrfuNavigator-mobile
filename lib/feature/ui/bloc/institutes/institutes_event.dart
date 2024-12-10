part of 'institutes_bloc.dart';

@freezed
class InstitutesEvent with _$InstitutesEvent {
  const factory InstitutesEvent.fetch() = InstitutesEventFetch;
}
