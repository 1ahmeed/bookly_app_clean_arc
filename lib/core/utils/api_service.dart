import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>>? get({
    required String endPoint,
    // String lang = "en",
    // String? token,
  }) async {
    // _dio.options.headers={
    //   "lang":lang,
    //   "authorization":token,
    // };
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>>? post({
    required String endPoint,
    required Map<String, dynamic> body,
    // String lang = "en",
    // String? token,
  }) async {
    // _dio.options.headers={
    //   "lang":lang,
    //   "authorization":token,
    // };
    var response = await _dio.post("$_baseUrl$endPoint", data: body);
    return response.data;
  }

  Future<Map<String, dynamic>>? put({
    required String endPoint,
    required Map<String, dynamic> body,
    // String lang = "en",
    // String? token,
  }) async {
    // _dio.options.headers={
    //   "lang":lang,
    //   "authorization":token,
    // };
    var response = await _dio.put("$_baseUrl$endPoint", data: body);
    return response.data;
  }


}
