// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/network/home_remote_data_source.dart' as _i275;
import '../../features/home/data/repositories/home_repositories_impl.dart'
    as _i751;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/usecase/get_user_movies.dart' as _i908;
import '../../features/home/presentation/bloc/home_cubit.dart' as _i816;
import '../networkInfo/network_info.dart' as _i111;
import '../platform/rest_client_service.dart' as _i106;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalModule = _$ExternalModule();
    gh.lazySingleton<_i895.Connectivity>(() => externalModule.connectivity);
    gh.lazySingleton<_i361.Dio>(() => externalModule.dio);
    gh.lazySingleton<_i106.RestClientService>(
      () => _i106.RestClientService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i275.HomeRemoteDataSource>(
      () => _i275.HomeRemoteDataSourceImpl(
        service: gh<_i106.RestClientService>(),
      ),
    );
    gh.lazySingleton<_i111.NetworkInfo>(
      () => _i111.InternetInfo(gh<_i895.Connectivity>()),
    );
    gh.singleton<_i0.HomeRepository>(
      () => _i751.HomeRepositoryImpl(
        networkInfo: gh<_i111.NetworkInfo>(),
        remoteDataSource: gh<_i275.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i908.GetUserMovies>(
      () => _i908.GetUserMovies(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i816.HomeCubit>(
      () => _i816.HomeCubit(gh<_i908.GetUserMovies>()),
    );
    return this;
  }
}

class _$ExternalModule extends _i212.ExternalModule {}
