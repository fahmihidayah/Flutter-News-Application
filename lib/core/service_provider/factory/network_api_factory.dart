import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkAPIFactory {
  static Dio createDioInstance() {
    Dio dio = Dio()
      // ..options.baseUrl = "http://127.0.0.1:8001/api/"
      ..options.baseUrl = "http://192.168.100.147:8001/api/"
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..options.responseType = ResponseType.json;

    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }


}
