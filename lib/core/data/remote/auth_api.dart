import 'package:dio/dio.dart';
import 'package:news_app/core/data/models/user.dart';
import 'package:news_app/core/data/models/base_response.dart';
import 'package:news_app/core/data/remote/base_api.dart';

class AuthApi extends BaseApi {
  Dio dio;

  AuthApi({required this.dio});

  Future<BaseResponse<User>?> login(String username, String password) async {
    final BaseResponse<User> response = await processRequest(() async =>
    await dio.post(
        "v1/login", data: {'username': username, 'password': password}), (
        rawData) => BaseResponse.fromJson(rawData, details: User.fromJson(rawData['details']))
    );
    return response;
  }
}