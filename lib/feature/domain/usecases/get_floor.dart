// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/usecases/usecase.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/floor_repository.dart';

class GetFloor extends UseCase<Floor, FloorParams> {
  final FloorRepository floorRepository;

  GetFloor(this.floorRepository);

  @override
  Future<Either<Failure, Floor>> call(FloorParams params) async {
    return await floorRepository.getFloor(params.floor, params.institute);
  }
}

class FloorParams extends Equatable {
  final String floor;
  final String institute;

  FloorParams({
    required this.floor,
    required this.institute,
  });

  @override
  List<Object?> get props => [floor, institute];
}
