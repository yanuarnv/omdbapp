import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../error/failure.dart';

String mapFailureToMessage(Failure failure) {
  if (failure is ServerFailure) {
    return failure.msg;
  } else if (failure is CacheFailure) {
    return failure.msg;
  }else{
    return "Something went wrong";
  }
}
