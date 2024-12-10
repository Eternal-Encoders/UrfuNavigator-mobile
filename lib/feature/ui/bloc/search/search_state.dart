part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = SearchStateLoading;
  const factory SearchState.loaded({required SearchList searchLoaded}) =
      SearchStateLoaded;
  const factory SearchState.error() = SearchStateError;
}
