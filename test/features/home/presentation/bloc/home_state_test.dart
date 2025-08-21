import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:omdbapp/features/home/domain/entities/movie_entity.dart';
import 'package:omdbapp/features/home/presentation/bloc/home_cubit.dart';


@GenerateNiceMocks([MockSpec<MovieEntity>()])
import 'home_state_test.mocks.dart';
void main() {
  group('HomeState immutability tests', () {
    test('HomeSuccess with different movies lists are not equal', () {
      final mockMovie = MockMovieEntity();
      when(mockMovie.id).thenReturn(1);
      when(mockMovie.title).thenReturn('Test Movie');
      final state1 = HomeSuccess(movies: [mockMovie]);
      final state2 = HomeSuccess(movies: []);
      expect(state1 == state2, false);
    });

    test('HomeInitial states are equal', () {
      final state1 = HomeInitial();
      final state2 = HomeInitial();
      expect(state1 == state2, true);
    });

    test('HomeSuccess and HomeInitial are not equal', () {
      final state1 = HomeSuccess(movies: []);
      final state2 = HomeInitial();
      expect(state1 == state2, false);
    });
  });
}