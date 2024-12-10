// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/core/usecases/usecase.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/institute_repository.dart';

class GetInstitute extends UseCase<Institute, InstituteParams> {
  final InstituteRepository instituteRepository;

  GetInstitute(this.instituteRepository);

  @override
  Future<Either<Failure, Institute>> call(InstituteParams params) async {
    return await instituteRepository.getInstituteByUrl(params.institute);
  }
}

class InstituteParams extends Equatable {
  final String institute;

  InstituteParams({
    required this.institute,
  });

  @override
  List<Object?> get props => [institute];
}
