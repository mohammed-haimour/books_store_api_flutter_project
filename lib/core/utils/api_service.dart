import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final String baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required endPoint}) async {
    var res = await _dio.get("$baseUrl$endPoint");
    return res.data;
  }
}
