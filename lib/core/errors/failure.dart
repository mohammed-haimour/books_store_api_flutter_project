import 'package:dio/dio.dart';

abstract class Failure {
  final String msg;

  Failure(this.msg);
}

class ServerFailure extends Failure {
  ServerFailure(super.msg);

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure("Time Out !! , Please Try Again Later!");
      case DioErrorType.sendTimeout:
        return ServerFailure("Send Time Out !! , Please Try Again Later!");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Time Out !! , Please Try Again Later!");
      case DioErrorType.badResponse:
        return ServerFailure.fromRes(e.response!.statusCode!, e.response);
      case DioErrorType.cancel:
        return ServerFailure("Canceled , Please Try Again Later!");

      case DioErrorType.badCertificate:
        return ServerFailure("Bad Certificate , Please Try Again Later!");

      case DioErrorType.connectionError:
        return ServerFailure("Connection Error , Please Try Again Later!");
      case DioErrorType.unknown:
        return ServerFailure(
            "Please Check Your Internet Connection , Please Try Again Later!");
      default:
        return ServerFailure(
            "Oops Something Went Wrong (Server Error -- Client Error) , Please Try Again Later!");
    }
  }

  factory ServerFailure.fromRes(int? statusCode, dynamic res) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(res["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request Not Found , Please Try Again Later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error , Please Try Again Later!");
    } else {
      return ServerFailure(
          "Oops Something Went Wrong (Server Error -- Client Error) , Please Try Again Later!");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.msg);
}

class NetWorkFailure extends Failure {
  NetWorkFailure(super.msg);
}
