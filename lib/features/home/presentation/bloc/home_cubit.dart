import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:omdbapp/features/home/presentation/pages/horizontal_list_movie_widget.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecase/get_user_movies.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final GetUserMovies getUserMovies;

  HomeCubit(this.getUserMovies) : super(HomeInitial());

  void fetchMovies(String type) async {
    emit(HomeLoading());
    final result = await getUserMovies(Params(type));
    result.fold(
      (failure) {
        print(mapFailureToMessage(failure));
        emit(HomeFailure(mapFailureToMessage(failure)));
      },
      (movies) => emit(HomeSuccess(movies: movies)),
    );
  }
}
