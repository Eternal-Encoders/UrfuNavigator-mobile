import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';

abstract class InstituteRepository {
  Future<Either<Failure, InstitutesList>> getInstitutes();
  Future<Either<Failure, Institute>> getInstituteByUrl(String institute);
}
