// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/platform/network_info.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/path/path_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/path/path_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/path_repository.dart';

class PathRepositoryImpl implements PathRepository {
  final PathRemoteDataSource remoteDataSource;
  final PathLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PathRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Path>> getPath(String from, String to) async {
    return await _getPath(() {
      return remoteDataSource.getPath(from, to);
    });
  }

  Future<Either<Failure, Path>> _getPath(
      Future<Path> Function() getPath) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePath = await getPath();
        localDataSource.pathToCache(remotePath);
        return Right(remotePath);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPath = await localDataSource.getLastPathFromCache();
        return Right(localPath);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
