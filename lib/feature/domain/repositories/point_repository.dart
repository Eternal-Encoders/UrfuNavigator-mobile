import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/feature/data/models/points/points.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

abstract class PointRepository {
  Future<Either<Failure, PointsList>> getPointsByType(EPointTypes? type,
      String? institute, String? floor, String? name, String? length);
  Future<Either<Failure, Point>> getPointById(String id);
}
