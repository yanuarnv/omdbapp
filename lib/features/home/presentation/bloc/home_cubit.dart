import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdbapp/features/home/presentation/pages/horizontal_list_movie_widget.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecase/get_user_movies.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUserMovies getUserMovies;

  HomeCubit(this.getUserMovies) : super(const HomeState.initial());

  void fetchMovies(String type) async {
    emit(HomeState.loading());
    final result = await getUserMovies(Params(type));
    result.fold(
      (failure) => emit(HomeState.error(mapFailureToMessage(failure))),
      (movies) {
        switch (type) {
          case "top-rated":
            emit((state as _Success).copyWith(topRated: movies));
            break;
          case "popular":
            emit((state as _Success).copyWith(popular: movies));
            break;
          default:
            emit((state as _Success).copyWith(upComing: movies));
        }
      },
    );
  }
}
