import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:omdbapp/features/home/data/network/home_remote_data_source.dart';

@GenerateNiceMocks([MockSpec<HomeRemoteDataSource>()])
import 'home_repository_test.mocks.dart';

void main() {
  late HomeRemoteDataSource remoteDatasource;

  setUp(() {
    remoteDatasource = MockHomeRemoteDataSource();
  });

  
}
