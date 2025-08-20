import 'package:dartz/dartz.dart';
import 'package:omdbapp/core/error/failure.dart';

import '../entities/movie_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovieList(String type);
}
