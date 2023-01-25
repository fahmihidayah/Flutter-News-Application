import 'package:dio/dio.dart';

class BaseApi {
  Future<T> processRequest<T>(Future<Response<dynamic>> Function() request,
      T Function(dynamic) build) async {
    try {
      //calling api await dio.post(endPoints(apiEndpoints: ApiEndpoints.login)
      final response = await request();
      if (response.statusCode == 200) {
        return build(response.data);
      }
    } catch (error) {
      // if statusCode header of response is not 2xx. Dio throw exception
      if (error is DioError && error.response != null) {
        if (error.response!.data['errors'] != null) {
          throw Exception(
            error.response!.data['errors'][0],
          );
        } else {
          throw Exception(
            error.response!.data['success'].toString(),
          );
        }
      } else {
        rethrow;
      }
    }
    throw Exception("Something went wrong");
  }
}