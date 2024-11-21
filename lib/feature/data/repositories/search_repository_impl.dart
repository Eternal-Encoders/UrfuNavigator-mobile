// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/platform/network_info.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/search/search_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/search/search_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;
  final SearchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SearchList>> getSearchPoints(
      String name, String? length) async {
    return await _getSearchPoints(() {
      return remoteDataSource.getSearchPoints(name, length);
    });
  }

  Future<Either<Failure, SearchList>> _getSearchPoints(
      Future<SearchList> Function() getSearchPoints) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSearch = await getSearchPoints();
        localDataSource.searchToCache(remoteSearch);
        return Right(remoteSearch);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSearch = await localDataSource.getLastSearchFromCache();
        return Right(localSearch);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
