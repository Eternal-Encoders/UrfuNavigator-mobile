import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart';

abstract class PathRepository {
  Future<Either<Failure, Path>> getPath(String from, String to);
}
