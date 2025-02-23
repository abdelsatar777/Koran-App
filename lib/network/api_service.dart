import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  String baseUrl = "https://api.alquran.cloud/v1/";
  String baseUrl_2 = "https://api3.islamhouse.com/v3/";

  get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }

  get_2({required String endPoint}) async {
    var response = await dio.get("$baseUrl_2$endPoint");
    return response.data;
  }
}
