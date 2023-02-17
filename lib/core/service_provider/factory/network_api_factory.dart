import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkAPIFactory {

  static Map<String, String> createHeaders() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  static BaseOptions createBaseOptions() {
    return BaseOptions(
      baseUrl: "http://192.168.100.147:8001/api/",
      headers: createHeaders(),
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 15000,
      responseType: ResponseType.json
    );
  }

  static Dio createDioInstance() {
    Dio dio = Dio(createBaseOptions());
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }


}
