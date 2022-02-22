import 'package:dartz/dartz.dart' show Either;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Failure;

// accept any type of data
// and play with params, e.g. print the params
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// we create NoParams class to skip Params because at this usecase, api itself will generate number not us
// and added here, because we can use it in multiple usecases
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
