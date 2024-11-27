import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_search_points.dart';

part 'search_bloc.freezed.dart';
// part 'floor_bloc.g.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchPoints getSearchPoints;
  SearchBloc({required this.getSearchPoints})
      : super(const SearchState.loading()) {
    on<SearchEventFetch>((event, emit) async {
      emit(const SearchState.loading());

      final failureOrSearch = await getSearchPoints(
          SearchParams(name: event.name, length: event.length));
      emit(failureOrSearch.fold((failure) => SearchState.error(), (search) {
        return SearchState.loaded(searchLoaded: search);
      }));
    });
  }
}
