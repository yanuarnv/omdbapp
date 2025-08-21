import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RestClientService {
  final Dio _dio;

  RestClientService(this._dio);

  Future<Response> getMovies(String path) async {
    return await _dio.get('/3/movie/$path?language=en-US&page=1');
  }
}

extension RestClientServiceX on RestClientService {
  static Dio create() {
    final baseUrl = dotenv.env['BASE_URL'];
    final key = dotenv.env['API_KEY'];
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl!,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $key'},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: false,
        requestBody: false,
        responseHeader: false,
        responseBody: false,
        error: true,
      ),
    );

    return dio;
  }
}
