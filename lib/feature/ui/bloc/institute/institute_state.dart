part of 'institute_bloc.dart';

@freezed
class InstituteState with _$InstituteState {
  const factory InstituteState.loading() = InstituteStateLoading;
  const factory InstituteState.loaded({required Institute instituteLoaded}) =
      InstituteStateLoaded;
  const factory InstituteState.error() = InstituteStateError;
}
