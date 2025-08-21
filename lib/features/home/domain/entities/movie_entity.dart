import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

part 'movie_entity.g.dart';

// Entity for individual movie
@freezed
abstract class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids',defaultValue: []) List<int>? genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieEntity;

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);
}

@freezed
abstract class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    required int page,
    required List<MovieEntity> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
