part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.fetch({
    required String name,
    String? length,
  }) = SearchEventFetch;
}
