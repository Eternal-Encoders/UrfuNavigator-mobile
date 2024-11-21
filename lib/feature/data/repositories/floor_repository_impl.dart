// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/platform/network_info.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/floor/floor_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/floor/floor_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/floor_repository.dart';

class FloorRepositoryImpl implements FloorRepository {
  final FloorRemoteDataSource remoteDataSource;
  final FloorLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FloorRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Floor>> getFloor(
      String floor, String instNameRU) async {
    return await _getFloor(() {
      return remoteDataSource.getFloor(floor, instNameRU);
    });
  }

  Future<Either<Failure, Floor>> _getFloor(
      Future<Floor> Function() getFloor) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFloor = await getFloor();
        localDataSource.floorToCache(remoteFloor);
        return Right(remoteFloor);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFloor = await localDataSource.getLastFloorFromCache();
        return Right(localFloor);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
