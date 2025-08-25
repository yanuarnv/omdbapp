import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:omdbapp/core/error/failure.dart';
import 'package:omdbapp/core/networkInfo/network_info.dart';
import 'package:omdbapp/core/platform/rest_client_service.dart';
import 'package:omdbapp/features/home/domain/entities/movie_entity.dart';
import 'package:omdbapp/features/home/domain/repositories/home_repository.dart';

import '../network/home_remote_data_source.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovieList(String type) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getMovieList(type);
        return Right(response);
      } catch (e,s) {
        print(s);
        return Left(ServerFailure("Server Error : $e"));
      }
    }else{
      return Left(ServerFailure("network offline"));
    }
  }
}
