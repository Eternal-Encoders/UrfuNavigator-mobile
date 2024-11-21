import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';

abstract class FloorRepository {
  Future<Either<Failure, Floor>> getFloor(String floor, String instNameRU);
}
