import 'package:dartz/dartz.dart';
import 'package:urfu_navigator_mobile/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
