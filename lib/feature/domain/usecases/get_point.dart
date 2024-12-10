// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/usecases/usecase.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/point_repository.dart';

class GetPoint extends UseCase<Point, PointParams> {
  final PointRepository pointRepository;

  GetPoint(this.pointRepository);

  @override
  Future<Either<Failure, Point>> call(PointParams params) async {
    return await pointRepository.getPointById(params.id);
  }
}

class PointParams extends Equatable {
  final String id;
  PointParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
