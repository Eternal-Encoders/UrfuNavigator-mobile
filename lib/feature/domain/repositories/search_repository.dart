import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchList>> getSearchPoints(
      String name, String? length);
}
