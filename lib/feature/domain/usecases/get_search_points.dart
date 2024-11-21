// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/usecases/usecase.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/search_repository.dart';

class GetSearchPoints extends UseCase<SearchList, SearchParams> {
  final SearchRepository searchRepository;

  GetSearchPoints(this.searchRepository);

  @override
  Future<Either<Failure, SearchList>> call(SearchParams params) async {
    return await searchRepository.getSearchPoints(params.name, params.length);
  }
}

class SearchParams extends Equatable {
  final String name;
  final String? length;
  SearchParams({
    required this.name,
    this.length,
  });

  @override
  List<Object?> get props => [name, length];
}
