import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../platform/rest_client_service.dart';

@module
abstract class ExternalModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  Dio get dio => RestClientServiceX.create();
}
