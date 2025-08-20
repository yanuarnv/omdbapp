import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:omdbapp/core/error/failure.dart';
import 'package:omdbapp/core/usecase/usecase.dart';
import 'package:omdbapp/features/home/domain/repositories/home_repository.dart';

import '../entities/movie_entity.dart';

class GetUserMovies implements UseCase<List<MovieEntity>, Params> {
  final HomeRepository repository;

  GetUserMovies(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(Params params) async {
    return await repository.getMovieList(params.type);
  }
}

class Params extends Equatable {
  final String type;

  const Params(this.type);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
