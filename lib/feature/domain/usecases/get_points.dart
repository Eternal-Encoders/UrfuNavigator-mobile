// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/usecases/usecase.dart';
import 'package:urfu_navigator_mobile/feature/data/models/points/points.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/point_repository.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class GetPoints extends UseCase<PointsList, PointsParams> {
  final PointRepository pointRepository;

  GetPoints(this.pointRepository);

  @override
  Future<Either<Failure, PointsList>> call(PointsParams params) async {
    return await pointRepository.getPointsByType(params.type, params.institute,
        params.floor, params.name, params.length);
  }
}

class PointsParams extends Equatable {
  final EPointTypes? type;
  final String? institute;
  final String? floor;
  final String? name;
  final String? length;
  PointsParams({
    this.type,
    this.institute,
    this.floor,
    this.name,
    this.length,
  });

  @override
  List<Object?> get props => [type, institute, floor, name, length];
}
