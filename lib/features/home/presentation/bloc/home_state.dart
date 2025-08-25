part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieEntity> movies;

  HomeSuccess({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
