part of 'path_bloc.dart';

@freezed
class PathState with _$PathState {
  const factory PathState.loading() = PathStateLoading;
  const factory PathState.loaded({required Path pathLoaded}) = PathStateLoaded;
  const factory PathState.error() = PathStateError;
}
