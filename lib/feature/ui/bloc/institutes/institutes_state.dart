part of 'institutes_bloc.dart';

@freezed
class InstitutesState with _$InstitutesState {
  const factory InstitutesState.loading() = InstitutesStateLoading;
  const factory InstitutesState.loaded(
      {required InstitutesList institutesLoaded}) = InstitutesStateLoaded;
  const factory InstitutesState.error() = InstitutesStateError;
}
