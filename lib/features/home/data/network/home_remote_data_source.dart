import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:omdbapp/core/error/exceptions.dart';

import '../../../../core/platform/rest_client_service.dart';
import '../../domain/entities/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> getMovieList(String type);
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final RestClientService service;

  HomeRemoteDataSourceImpl({required this.service});

  @override
  Future<List<MovieEntity>> getMovieList(String type) async {
    final response = await service.getMovies(type);
    if (response.statusCode == 200) {
      final data = MovieResponse.fromJson(
       response.data as Map<String, dynamic>
      );
      return data.results;
    } else {
      throw ServerException(
        "Failed to load movies status code ${response.statusCode}",
      );
    }
  }
}
