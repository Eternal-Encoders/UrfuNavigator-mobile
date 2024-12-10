// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/institute_repository.dart';

class GetInstitutes {
  final InstituteRepository instituteRepository;

  GetInstitutes(this.instituteRepository);

  Future<Either<Failure, InstitutesList>> call() async {
    return await instituteRepository.getInstitutes();
  }
}
