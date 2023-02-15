import 'package:dio/dio.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/user.dart';
import 'package:news_app/data/remote/auth/auth_api.dart';
import 'package:news_app/data/remote/base_api.dart';

class AuthApiImpl extends AuthApi {
  Dio dio;

  AuthApiImpl({required this.dio});

  Future<BaseResponse<User>?> login(String username, String password) async {
    final BaseResponse<User> response = await processRequest(() async =>
    await dio.post(
        "v1/login", data: {'username': username, 'password': password}), (
        rawData) => BaseResponse.fromJson(rawData, details: User.fromJson(rawData['details']))
    );
    return response;
  }
}