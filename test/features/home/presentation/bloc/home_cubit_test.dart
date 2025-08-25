import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:omdbapp/features/home/data/network/home_remote_data_source.dart';
import 'package:omdbapp/features/home/domain/repositories/home_repository.dart';
import 'package:omdbapp/features/home/domain/usecase/get_user_movies.dart';
import 'package:omdbapp/features/home/presentation/bloc/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

@GenerateNiceMocks([MockSpec<GetUserMovies>()])
import 'home_cubit_test.mocks.dart';

void main() {
  late HomeCubit cubit;
  late MockGetUserMovies useCase;
  setUp(() {
    useCase = MockGetUserMovies();
    when(useCase.call(any)).thenAnswer((_) async => Right([]));
    cubit = HomeCubit(useCase);
  });

  test("initial state", () {
    expect(cubit.state, HomeInitial());
  });

  blocTest<HomeCubit, HomeState>(
    'ensure cubit state call fetchMovies with top_week',
    build: () {
      when(useCase.call(any)).thenAnswer((_) async => Right([]));
      return cubit;
    },
    act: (bloc) {
      bloc.fetchMovies('top_week');
    },
    expect: () => [HomeLoading(), HomeSuccess(movies: [])],
  );

  blocTest<HomeCubit, HomeState>(
    'call fetchMovies with top_week',
    build: () => cubit,
    act: (bloc) => bloc.fetchMovies('top_week'),
    verify: (_) {
      verify(useCase.call(Params('top_week'))).called(1);
    },
  );
}
