import 'package:dartz/dartz.dart';
import 'package:omdbapp/core/error/failure.dart';
import 'package:omdbapp/features/home/domain/entities/movie_entity.dart';
import 'package:omdbapp/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovieList(String type) {
    // TODO: implement getMovieList
    throw UnimplementedError();
  }
}
