import '../error/failure.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure server:
      return server.msg;
    case CacheFailure cache:
      return cache.msg;
    default:
      return 'Unexpected error';
  }
}