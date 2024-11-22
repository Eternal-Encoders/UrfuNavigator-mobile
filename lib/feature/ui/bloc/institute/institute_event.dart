part of 'institute_bloc.dart';

@freezed
class InstituteEvent with _$InstituteEvent {
  const factory InstituteEvent.fetch({
    required String url,
  }) = InstituteEventFetch;
}
