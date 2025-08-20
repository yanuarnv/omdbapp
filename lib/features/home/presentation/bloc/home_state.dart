part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.success({
    required List<MovieEntity> topRated,
    required List<MovieEntity> popular,
    required List<MovieEntity> upComing,
  }) = _Success;

  const factory HomeState.error(String message) = _Error;

}
