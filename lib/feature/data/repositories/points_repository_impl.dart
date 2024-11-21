// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/platform/network_info.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/points/points_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/points/points_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/feature/data/models/points/points.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/point_repository.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class PointsRepositoryImpl implements PointRepository {
  final PointsRemoteDataSource remoteDataSource;
  final PointsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PointsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, PointsList>> _getPoints(
      Future<PointsList> Function() getPoints) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteInstitutes = await getPoints();
        localDataSource.pointsToCache(remoteInstitutes);
        return Right(remoteInstitutes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localInstitutes = await localDataSource.getLastPointsFromCache();
        return Right(localInstitutes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  Future<Either<Failure, Point>> _getPoint(
      Future<Point> Function() getPoint) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePoint = await getPoint();
        localDataSource.pointToCache(remotePoint);
        return Right(remotePoint);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localInstitutes = await localDataSource.getLastPointFromCache();
        return Right(localInstitutes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Point>> getPointById(String id) async {
    return await _getPoint(() {
      return remoteDataSource.getPointById(id);
    });
  }

  @override
  Future<Either<Failure, PointsList>> getPointsByType(EPointTypes? type,
      String? institute, String? floor, String? name, String? length) async {
    return await _getPoints(() {
      return remoteDataSource.getPointsByType(
          type, institute, floor, name, length);
    });
  }
}
