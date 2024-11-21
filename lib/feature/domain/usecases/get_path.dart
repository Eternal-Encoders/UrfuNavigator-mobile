// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/usecases/usecase.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart'
    // ignore: library_prefixes
    as PathModel;
import 'package:urfu_navigator_mobile/feature/domain/repositories/path_repository.dart';

class GetPath extends UseCase<PathModel.Path, PathParams> {
  final PathRepository pathRepository;

  GetPath(this.pathRepository);

  @override
  Future<Either<Failure, PathModel.Path>> call(PathParams params) async {
    return await pathRepository.getPath(params.from, params.to);
  }
}

class PathParams extends Equatable {
  final String from;
  final String to;
  PathParams({
    required this.from,
    required this.to,
  });

  @override
  List<Object?> get props => [from, to];
}
