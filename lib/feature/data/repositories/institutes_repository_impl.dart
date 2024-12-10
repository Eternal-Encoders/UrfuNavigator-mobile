// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/platform/network_info.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/institutes/institutes_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/institutes/institutes_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/institute_repository.dart';

class InstitutesRepositoryImpl implements InstituteRepository {
  final InstitutesRemoteDataSource remoteDataSource;
  final InstitutesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  InstitutesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, InstitutesList>> getInstitutes() async {
    return await _getInstitutes(() {
      return remoteDataSource.getInstitutes();
    });
  }

  Future<Either<Failure, InstitutesList>> _getInstitutes(
      Future<InstitutesList> Function() getInstitutes) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteInstitutes = await getInstitutes();
        localDataSource.institutesToCache(remoteInstitutes);
        return Right(remoteInstitutes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localInstitutes =
            await localDataSource.getLastInstitutesFromCache();
        return Right(localInstitutes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Institute>> getInstituteByUrl(String institute) async {
    return await _getInstitute(() {
      return remoteDataSource.getInstituteByUrl(institute);
    });
  }

  Future<Either<Failure, Institute>> _getInstitute(
      Future<Institute> Function() getInstituteByUrl) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteInstitutes = await getInstituteByUrl();
        localDataSource.instituteToCache(remoteInstitutes);
        return Right(remoteInstitutes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localInstitutes =
            await localDataSource.getLastInstituteFromCache();
        return Right(localInstitutes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
